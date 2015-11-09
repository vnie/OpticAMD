//
//  SavedTestResults.swift
//  opticAMD
//
//  Created by Brian on 11/8/15.
//  Copyright © 2015 Med AppJam 2015 - Team 9. All rights reserved.
//

import Foundation
import UIKit

class SavedTestResults {
    
    // MARK: Properties
    private var testResults = [TestResult]()
    
    
    // MARK: Initialization
    init() {
        // Load any saved testResults, otherwise load sample data.
        if let savedTestResults = load() {
            testResults += savedTestResults
        } else {
            // Load the sample data.
            loadSampleTestResults()
        }
    }
    
    private func loadSampleTestResults() {
        let testResult1 = TestResult(name: "Grumpy Cat", image: UIImage(named: "cat")!)!
        let testResult2 = TestResult(name: "My First Test Result", image: UIImage(named: "amslerGrid")!)!
        testResults += [testResult1, testResult2]
    }
    
    func count() -> Int {
        return testResults.count
    }
    
    func get(row: Int) -> TestResult {
        return testResults[row]
    }
    
    func del(row: Int) {
        testResults.removeAtIndex(row)
    }
    
    
    // MARK: NSCoding
    func save() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(testResults, toFile: TestResult.ArchiveURL.path!)
        if isSuccessfulSave {
            print("Successfully saved testResults.")
        } else {
            print("Failed to save testResults...")
        }
    }
    
    func load() -> [TestResult]? {
        return NSKeyedUnarchiver.unarchiveObjectWithFile(TestResult.ArchiveURL.path!) as? [TestResult]
    }
}