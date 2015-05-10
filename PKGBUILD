pkgname=fusiondirectory-plugin-fax-schema
pkgver=1.0.8.8
pkgver=1.0.8.8
pkgrel=1
pkgdesc="LDAP schema for FusionDirectory fax plugin"
arch=('any')
url="http://fusiondirectory.org/"
license=('LGPL')

depends=('' 'fusiondirectory-plugin-systems' 'mysql-server' 'mysql-client-schema')

install=fusiondirectory-plugin-fax.install
source=("http://repos.fusiondirectory.org/sources/1.0/fusiondirectory/fusiondirectory-plugins-${pkgver}.tar.gz"
"http://repos.fusiondirectory.org/sources/1.0/fusiondirectory/fusiondirectory-${pkgver}.tar.gz")
md5sums=('7ea8890ffbdf05ef4f6478ab1c49afea'
'e169b4ca7ac809a6b939ed06d81c0f2a')

package() {
cd ./fusiondirectory-plugins-${pkgver}
# Go in plugin directory
cd fax/

    # Openldap section
    if [ -d ./contrib/openldap ] ; then
      mkdir -p ${pkgdir}/etc/openldap/schema/fusiondirectory/
      mkdir -p ${pkgdir}/usr/share/doc/fusiondirectory-plugin-fax-schema/
      cp ../../fusiondirectory-${pkgver}/{AUTHORS,Changelog,COPYING} ${pkgdir}/usr/share/doc/fusiondirectory-plugin-fax-schema/   
 
      # Directories
      for cur_openldap in $(find ./contrib/openldap -mindepth 1 -maxdepth 1 -type d) ; do
        openldap_line="$(echo ${cur_openldap} | sed "s#./contrib/openldap/##")" 
        cp -a ./contrib/openldap/${openldap_line} ${pkgdir}/etc/openldap/schema/fusiondirectory/
      done
    
      # Files
      for cur_openldap in $(find ./contrib/openldap -mindepth 1 -maxdepth 1 -type f ! -name 'example.ldif' ) ; do
        openldap_line="$(echo ${cur_openldap} | sed "s#./contrib/openldap/##")" 
        cp -a ./contrib/openldap/${openldap_line} ${pkgdir}/etc/openldap/schema/fusiondirectory/
      done
    fi

}
