SELECT 
nagios_instances.instance_id
,nagios_instances.instance_name
,nagios_contacts.contact_object_id
,obj1.name1 AS contact_name
,nagios_contactstatus.*
FROM `nagios_contactstatus`
LEFT JOIN nagios_objects as obj1 ON nagios_contactstatus.contact_object_id=obj1.object_id
LEFT JOIN nagios_contacts ON nagios_contactstatus.contact_object_id=nagios_contacts.contact_object_id
LEFT JOIN nagios_instances ON nagios_contacts.instance_id=nagios_instances.instance_id
WHERE nagios_contacts.config_type='1'
ORDER BY instance_name ASC, contact_name ASC