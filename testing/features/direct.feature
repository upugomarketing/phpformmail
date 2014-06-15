Feature: direct
  In order to test direct access to the script
  As a anonymous users
  I need to receive the correct error messages

  Scenario: Direct to formmail.php
    Given I am on "src/formmail.php"
    Then I should see "Nothing was sent by a form. (No data was sent by POST or GET method.) There is nothing to process here."

  Scenario: Direct to formprocessor.php
    Given I am on "src/formprocessor.php"
    Then I should see "Nothing was sent by a form. (No data was sent by POST or GET method.) There is nothing to process here."

  Scenario: Direct to formprocessor.php w/ get
    Given I am on "src/formprocessor.php?test=test"
    Then I should see "There are no referers defined. All submissions will be denied."
    And I should see "There is no recipient to send this mail to."
    And I should see "PHPFormMail has experienced errors that must be fixed by the webmaster. Mail will NOT be sent until these issues are resolved. Once these issues are resolved, you will have to resubmit your form to PHPFormMail for the mail to be sent."

  Scenario: Direct to formprocessor.php w/ get recipient
    Given I am on "src/formprocessor.php?recipient=test"
    Then I should see "There are no referers defined. All submissions will be denied."
    And I should see "You are trying to send mail to a domain that is not in the allowed recipients list."
    And I should see "PHPFormMail has experienced errors that must be fixed by the webmaster. Mail will NOT be sent until these issues are resolved. Once these issues are resolved, you will have to resubmit your form to PHPFormMail for the mail to be sent."
