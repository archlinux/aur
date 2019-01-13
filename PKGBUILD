pkgname=fusiondirectory-plugin-subcontracting-schema
pkgver=1.2.3
pkgrel=1
pkgdesc="LDAP schema for FusionDirectory subcontracting plugin"
arch=("any")
url="http://fusiondirectory.org/"
license=("GPL")

depends=("fusiondirectory-schema>=$pkgver")

source=("https://repos.fusiondirectory.org/sources/fusiondirectory/fusiondirectory-plugins-${pkgver}.tar.gz"
"https://repos.fusiondirectory.org/sources/fusiondirectory/fusiondirectory-${pkgver}.tar.gz")
md5sums=('2a67d8454cfeed2b7805e96b5cf1b48a' '36b18a7f82f6e796ce20f815b449eab4')

package() {
cd ./fusiondirectory-plugins-${pkgver}
# Go in plugin directory
cd subcontracting/

    # Openldap section
    if [ -d ./contrib/openldap ] ; then
      mkdir -p ${pkgdir}/etc/openldap/schema/fusiondirectory/
      mkdir -p ${pkgdir}/usr/share/doc/fusiondirectory-plugin-subcontracting-schema/
      cp ../../fusiondirectory-${pkgver}/{AUTHORS.md,Changelog,COPYING} ${pkgdir}/usr/share/doc/fusiondirectory-plugin-subcontracting-schema/   
 
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
