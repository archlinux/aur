pkgname=fusiondirectory-plugin-dovecot-schema
pkgver=1.0.9
pkgver=1.0.9
pkgrel=1
pkgdesc="LDAP schema for FusionDirectory dovecot plugin"
arch=("any")
url="http://fusiondirectory.org/"
license=("LGPL")
depends=("fusiondirectory-schema>=$pkgver" "fusiondirectory-plugin-systems-schema>=$pkgver")

install=fusiondirectory-plugin-dovecot.install
source=("http://repos.fusiondirectory.org/sources/1.0/fusiondirectory/fusiondirectory-plugins-${pkgver}.tar.gz"
"http://repos.fusiondirectory.org/sources/1.0/fusiondirectory/fusiondirectory-${pkgver}.tar.gz")
md5sums=('7c761f082278bfdcc5e9130e8fa4d3a0' '76f56b46c20dbf474d5d4030554fc6ba')

package() {
cd ./fusiondirectory-plugins-${pkgver}
# Go in plugin directory
cd dovecot/

    # Openldap section
    if [ -d ./contrib/openldap ] ; then
      mkdir -p ${pkgdir}/etc/openldap/schema/fusiondirectory/
      mkdir -p ${pkgdir}/usr/share/doc/fusiondirectory-plugin-dovecot-schema/
      cp ../../fusiondirectory-${pkgver}/{AUTHORS,Changelog,COPYING} ${pkgdir}/usr/share/doc/fusiondirectory-plugin-dovecot-schema/   
 
      # Directories
      for cur_openldap in $(find ./contrib/openldap -mindepth 1 -maxdepth 1 -type d) ; do
        openldap_line="$(echo ${cur_openldap} | sed "s#./contrib/openldap/##")" 
        cp -a ./contrib/openldap/${openldap_line} ${pkgdir}/etc/openldap/schema/fusiondirectory/
      done
    
      # Files
      for cur_openldap in $(find ./contrib/openldap -mindepth 1 -maxdepth 1 -type f ! -name "example.ldif" ) ; do
        openldap_line="$(echo ${cur_openldap} | sed "s#./contrib/openldap/##")" 
        cp -a ./contrib/openldap/${openldap_line} ${pkgdir}/etc/openldap/schema/fusiondirectory/
      done
    fi

}
