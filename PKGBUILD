pkgname=fusiondirectory-plugin-sudo
pkgver=1.0.8.8
pkgrel=1
pkgdesc="Sudo manager"
arch=('any')
url="http://fusiondirectory.org/"
license=('LGPL')
depends=('fusiondirectory>=1.0.8.8')

install=fusiondirectory-plugin-sudo.install
source=("http://repos.fusiondirectory.org/sources/1.0/fusiondirectory/fusiondirectory-plugins-${pkgver}.tar.gz"
"http://repos.fusiondirectory.org/sources/1.0/fusiondirectory/fusiondirectory-${pkgver}.tar.gz")
md5sums=('7ea8890ffbdf05ef4f6478ab1c49afea'
'e169b4ca7ac809a6b939ed06d81c0f2a')

package() {
cd ./fusiondirectory-plugins-${pkgver}
# Go in plugin directory
cd sudo/


# Plugin developers
  if [ "sudo" = "developers" ] ; then
    mkdir -p ${pkgdir}/usr/share/doc/fusiondirectory-developers/
    mkdir -p ${pkgdir}/usr/share/webapps/fusiondirectory/plugins/
    mkdir -p ${pkgdir}/usr/share/webapps/fusiondirectory/html/plugins/debug-help
    cp -a ./CODING ${pkgdir}/usr/share/doc/fusiondirectory-developers/
    cp -a ./Doxyfile ${pkgdir}/usr/share/doc/fusiondirectory-developers/
    cp -a ./FDStandard ${pkgdir}/usr/share/doc/fusiondirectory-developers/
    cp -a ./filter.xsd  ${pkgdir}/usr/share/doc/fusiondirectory-developers/
    cp -a ./list.xsd ${pkgdir}/usr/share/doc/fusiondirectory-developers/
    cp -a ./simple-plugin ${pkgdir}/usr/share/doc/fusiondirectory-developers/
    cp -a ./debug-help ${pkgdir}/usr/share/webapps/fusiondirectory/plugins/
    cp -a ./debug-help/html/images ${pkgdir}/usr/share/webapps/fusiondirectory/html/plugins/debug-help
    
  else
    # Addons section
    if [ -d ./addons ] ; then
      mkdir -p ${pkgdir}/usr/share/webapps/fusiondirectory/plugins/addons/
      
      # Directories
      for cur_addons in $(find ./addons -mindepth 1 -maxdepth 1 -type d) ; do
        addons_line="$(echo ${cur_addons} | sed "s#./addons/##")" 
        cp -a ./addons/${addons_line} ${pkgdir}/usr/share/webapps/fusiondirectory/plugins/addons/${addons_line}
      done
    
      # Files
      for cur_addons in $(find ./addons -mindepth 1 -maxdepth 1 -type f) ; do
        addons_line="$(echo ${cur_addons} | sed "s#./addons/##")" 
        cp -a ./addons/${addons_line} ${pkgdir}/usr/share/webapps/fusiondirectory/plugins/addons/
      done
    fi
    
    
    # Admin section
    if [ -d ./admin ] ; then
      mkdir -p ${pkgdir}/usr/share/webapps/fusiondirectory/plugins/admin/
    
      # Directories
      for cur_admin in $(find ./admin -mindepth 1 -maxdepth 1 -type d) ; do
        admin_line="$(echo ${cur_admin} | sed "s#./admin/##")" 
        cp -a ./admin/${admin_line} ${pkgdir}/usr/share/webapps/fusiondirectory/plugins/admin/${admin_line}
      done
    
      # Files
      for cur_admin in $(find ./admin -mindepth 1 -maxdepth 1 -type f) ; do
        admin_line="$(echo ${cur_admin} | sed "s#./admin/##")" 
        cp -a ./admin/${admin_line} ${pkgdir}/usr/share/webapps/fusiondirectory/plugins/admin/${admin_line}
      done
    fi
    
    
    # Config section
    if [ -d ./config ] ; then
      mkdir -p ${pkgdir}/usr/share/webapps/fusiondirectory/plugins/config/
    
      # Directories
      for cur_config in $(find ./config -mindepth 1 -maxdepth 1 -type d) ; do
        config_line="$(echo ${cur_config} | sed "s#./config/##")" 
        cp -a ./config/${config_line} ${pkgdir}/usr/share/webapps/fusiondirectory/plugins/config/
      done

      # Files
      for cur_config in $(find ./config -mindepth 1 -maxdepth 1 -type f) ; do
        config_line="$(echo ${cur_config} | sed "s#./config/##")" 
        cp -a ./config/${config_line} ${pkgdir}/usr/share/webapps/fusiondirectory/plugins/config/
      done
    fi
    
    
    # HTML section
    if [ -d ./html ] ; then
      if [ "sudo" = "addressbook" ] ; then
        mkdir -p ${pkgdir}/usr/share/webapps/fusiondirectory/html/plugins/sudo/
        cp -a ./html/images/ ${pkgdir}/usr/share/webapps/fusiondirectory/html/plugins/sudo/
        cp -a ./html/getvcard.php ${pkgdir}/usr/share/webapps/fusiondirectory/html/plugins/sudo/
        
      elif [ "sudo" = "argonaut" ] ; then
        mkdir -p ${pkgdir}/usr/share/webapps/fusiondirectory/html/plugins/sudo/
        cp -a ./html/images/ ${pkgdir}/usr/share/webapps/fusiondirectory/html/plugins/sudo/
        
      elif [ "sudo" = "fax" ] ; then
        mkdir -p ${pkgdir}/usr/share/webapps/fusiondirectory/html/plugins/sudo/
        cp -a ./html/images/ ${pkgdir}/usr/share/webapps/fusiondirectory/html/plugins/sudo/
        cp -a ./html/getfax.php ${pkgdir}/usr/share/webapps/fusiondirectory/html/plugins/sudo/
        
      elif [ "sudo" = "fusioninventory" ] ; then
        mkdir -p ${pkgdir}/usr/share/webapps/fusiondirectory/html/
        mkdir -p ${pkgdir}/usr/share/webapps/fusiondirectory/html/plugins/sudo/
        cp -a ./html/collect.php ${pkgdir}/usr/share/webapps/fusiondirectory/html/
        cp -a ./html/images/ ${pkgdir}/usr/share/webapps/fusiondirectory/html/plugins/sudo/
        cp -a ./html/plugins/inventory.css ${pkgdir}/usr/share/webapps/fusiondirectory/html/plugins/sudo/

      elif [ "sudo" = "ejbca" ] ; then
        mkdir -p ${pkgdir}/usr/share/webapps/fusiondirectory/html/
        cp -a ./html/themes/ ${pkgdir}/usr/share/webapps/fusiondirectory/html/

      else
        # Directories
        for cur_html in $(find ./html -mindepth 1 -maxdepth 1 -type d) ; do
          mkdir -p ${pkgdir}/usr/share/webapps/fusiondirectory/html/plugins/sudo/
          html_line="$(echo ${cur_html} | sed "s#./html/##")" 
          cp -a ./html/${html_line} ${pkgdir}/usr/share/webapps/fusiondirectory/html/plugins/sudo/
        done

        # Files
        for cur_html in $(find ./html -mindepth 1 -maxdepth 1 -type f) ; do
          mkdir -p ${pkgdir}/usr/share/webapps/fusiondirectory/html/
          html_line="$(echo ${cur_html} | sed "s#./html/##")" 
          cp -a ./html/${html_line} ${pkgdir}/usr/share/webapps/fusiondirectory/html/
        done
      fi
    fi
    
    
    # Include section
    if [ -d ./include ] ; then    
      # Directories
      for cur_include in $(find ./include -mindepth 1 -maxdepth 1 -type d) ; do
        include_line="$(echo ${cur_include} | sed "s#./include/##")" 
        cp -a ./include/${include_line} ${pkgdir}/usr/share/webapps/fusiondirectory/include/
      done
      
      # Files
      for cur_include in $(find ./include -mindepth 1 -maxdepth 1 -type f) ; do
        include_line="$(echo ${cur_include} | sed "s#./include/##")" 
        cp -a ./include/${include_line} ${pkgdir}/usr/share/webapps/fusiondirectory/include/
      done
    fi
    
    
    # Locale section
    if [ -d ./locale ] ; then
      mkdir -p ${pkgdir}/usr/share/webapps/fusiondirectory/locale/plugins/sudo/locale/
      
      # Directories
      for cur_locale in $(find ./locale -mindepth 1 -maxdepth 1 -type d) ; do
        locale_line="$(echo ${cur_locale} | sed "s#./locale/##")" 
        cp -a ./locale/${locale_line} ${pkgdir}/usr/share/webapps/fusiondirectory/locale/plugins/sudo/locale/
      done
      
      # Files
      for cur_locale in $(find ./locale -mindepth 1 -maxdepth 1 -type f) ; do
        locale_line="$(echo ${cur_locale} | sed "s#./locale/##")" 
        cp -a ./locale/${locale_line} ${pkgdir}/usr/share/webapps/fusiondirectory/locale/plugins/sudo/locale/
      done
    fi

    
    # Personal section
    if [ -d ./personal ] ; then
      mkdir -p ${pkgdir}/usr/share/webapps/fusiondirectory/plugins/personal/
    
      # Directories
      for cur_personal in $(find ./personal -mindepth 1 -maxdepth 1 -type d) ; do
        personal_line="$(echo ${cur_personal} | sed "s#./personal/##")" 
        cp -a ./personal/${personal_line} ${pkgdir}/usr/share/webapps/fusiondirectory/plugins/personal/
      done
    
      # Files
      for cur_personal in $(find ./personal -mindepth 1 -maxdepth 1 -type f) ; do
        personal_line="$(echo ${cur_personal} | sed "s#./personal/##")" 
        cp -a ./personal/${personal_line} ${pkgdir}/usr/share/webapps/fusiondirectory/plugins/personal/
      done
    fi
    
    # Contrib section for samba and supann
    if [ "sudo" = "samba" ] ; then
      mkdir -p ${pkgdir}/usr/share/doc/fusiondirectory-plugin-samba/
      cp -a ./contrib/fix_munged ${pkgdir}/usr/share/doc/fusiondirectory-plugin-samba/
      
    elif [ "sudo" = "supann" ] ; then
      mkdir -p ${pkgdir}/usr/share/doc/fusiondirectory-plugin-supann/examples/
      cp -a ./contrib/supann/* ${pkgdir}/usr/share/doc/fusiondirectory-plugin-supann/examples/
    fi 
    
    # SQL section
    if [ -d ./contrib/sql ] ; then
      mkdir -p ${pkgdir}/usr/share/doc/fusiondirectory-plugin-sudo-schema/
      cp ../../fusiondirectory-${pkgver}/{AUTHORS,Changelog,COPYING} ${pkgdir}/usr/share/doc/fusiondirectory-plugin-sudo-schema/   
 
      # Directories
      for cur_sql in $(find ./contrib/sql -mindepth 1 -maxdepth 1 -type d) ; do
        sql_line="$(echo ${cur_sql} | sed "s#./contrib/sql/##")" 
        cp -a ./contrib/sql/${sql_line} ${pkgdir}/usr/share/doc/fusiondirectory-plugin-sudo-schema/
      done
    
      # Files
      for cur_sql in $(find ./contrib/sql -mindepth 1 -maxdepth 1 -type f ! -name 'example.ldif' ) ; do
        sql_line="$(echo ${cur_sql} | sed "s#./contrib/sql/##")" 
        cp -a ./contrib/sql/${sql_line} ${pkgdir}/usr/share/doc/fusiondirectory-plugin-sudo-schema/
      done   
    fi
  fi
  

	# Docs
	mkdir -p ${pkgdir}/usr/share/doc/fusiondirectory-plugin-sudo/
	cp ../../fusiondirectory-${pkgver}/{AUTHORS,Changelog,COPYING} ${pkgdir}/usr/share/doc/fusiondirectory-plugin-sudo/ 
 
}
