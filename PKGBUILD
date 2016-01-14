pkgname=fusiondirectory-plugin-mail-schema
pkgver=1.0.9.2
pkgver=1.0.9.2
pkgrel=1
pkgdesc="LDAP schema for FusionDirectory mail plugin"
arch=("any")
url="http://fusiondirectory.org/"
license=("LGPL")

depends=("fusiondirectory-schema>=$pkgver" "fusiondirectory-plugin-systems-schema>=$pkgver")

source=("http://repos.fusiondirectory.org/sources/1.0/fusiondirectory/fusiondirectory-plugins-${pkgver}.tar.gz"
"http://repos.fusiondirectory.org/sources/1.0/fusiondirectory/fusiondirectory-${pkgver}.tar.gz")
md5sums=('e6d29278191de3288efdb7d43dd25d98' '07ba5c23c6ea6d1aa15d24d828841acf')

package() {
cd ./fusiondirectory-plugins-${pkgver}
# Go in plugin directory
cd mail/

    # Openldap section
    if [ -d ./contrib/openldap ] ; then
      mkdir -p ${pkgdir}/etc/openldap/schema/fusiondirectory/
      mkdir -p ${pkgdir}/usr/share/doc/fusiondirectory-plugin-mail-schema/
      cp ../../fusiondirectory-${pkgver}/{AUTHORS,Changelog,COPYING} ${pkgdir}/usr/share/doc/fusiondirectory-plugin-mail-schema/   
 
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
