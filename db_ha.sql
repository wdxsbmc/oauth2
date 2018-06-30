CREATE DATABASE IF NOT EXISTS db_ha;

USE db_ha;

CREATE TABLE oauth_clients ( client_id VARCHAR(80) NOT NULL, client_secret VARCHAR(80) NOT NULL, redirect_uri VARCHAR(2000)  NOT NULL, CONSTRAINT client_id_pk PRIMARY KEY (client_id));

CREATE TABLE oauth_access_tokens (access_token VARCHAR(40) NOT NULL, client_id VARCHAR(80) NOT NULL, user_id VARCHAR(255), expires TIMESTAMP NOT NULL,scope VARCHAR(2000), CONSTRAINT access_token_pk PRIMARY KEY (access_token));

CREATE TABLE oauth_authorization_codes (authorization_code VARCHAR(40) NOT NULL, client_id VARCHAR(80) NOT NULL, user_id VARCHAR(255), redirect_uri VARCHAR(2000) NOT NULL, expires TIMESTAMP NOT NULL, scope VARCHAR(2000), CONSTRAINT auth_code_pk PRIMARY KEY (authorization_code));

CREATE TABLE oauth_refresh_tokens ( refresh_token VARCHAR(40) NOT NULL, client_id VARCHAR(80) NOT NULL, user_id VARCHAR(255), expires TIMESTAMP NOT NULL, scope VARCHAR(2000), CONSTRAINT refresh_token_pk PRIMARY KEY (refresh_token));

CREATE TABLE oauth_users (username VARCHAR(255) NOT NULL, password VARCHAR(2000), first_name VARCHAR(255), last_name VARCHAR(255), CONSTRAINT username_pk PRIMARY KEY (username)); 

CREATE TABLE oauth_scopes (
  scope               VARCHAR(80)     NOT NULL,
  is_default          BOOLEAN,
  PRIMARY KEY (scope)
);

CREATE TABLE IF NOT EXISTS `oauth_devices` (  `id` int(11) NOT NULL AUTO_INCREMENT,`user_id` varchar(255) NOT NULL,`deviceId` varchar(255) NOT NULL,  `deviceName` varchar(255) NOT NULL,  `jsonData` text NOT NULL, `devices` TEXT NOT NULL,  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,  `del` int(11) NOT NULL DEFAULT '0',`virtual` INT NOT NULL DEFAULT  '0',`zone` VARCHAR( 255 ) NOT NULL,PRIMARY KEY (`id`)) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2;  

CREATE TABLE user_data ( 
id bigint not null auto_increment,
user_id VARCHAR(255) NOT NULL,
homeassistantURL VARCHAR(255) NOT NULL,
homeassistantPASS VARCHAR(255) NOT NULL, 
user_name VARCHAR(255) NOT NULL, 
email VARCHAR(255),
expires TIMESTAMP NOT NULL,
fromwhere VARCHAR(20) NOT NULL,
PRIMARY KEY (id),
UNIQUE KEY inx_user_id(user_id)
);
