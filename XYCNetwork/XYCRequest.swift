//
//  XYCRequest.swift
//  CNYNetworking
//
//  Created by caonongyun on 16/7/14.
//  Copyright © 2016年 CNY. All rights reserved.
//

import UIKit
import Alamofire

typealias Callback = (data:AnyObject) -> Void
typealias Warn = (data:AnyObject) -> Void

class XYCRequest: XYCBaseRequest {
    
    class func request(urlString:String, param:AnyObject? = nil,success:Callback? = nil,warn:Warn? = nil,failure:Callback? = nil){

        Alamofire.request(.GET, urlString, parameters: param as? [String:String])
            .validate()
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization

                switch response.result {
                case .Success:
                    print("Validation Successful")
                    if success != nil{
                        success!(data: response.response!)
                    }
                case .Failure(let error):
                    print(error)
                    if failure != nil{
                        failure!(data: error as AnyObject)
                    }
                }
        }

    }
}
