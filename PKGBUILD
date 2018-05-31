pkgname=fusiondirectory-plugin-autofs-schema
pkgver=1.2
pkgver=1.2
pkgrel=1
pkgdesc="LDAP schema for FusionDirectory autofs plugin"
arch=("any")
url="http://fusiondirectory.org/"
license=("GPL")

depends=("fusiondirectory-schema>=$pkgver" "fusiondirectory-plugin-systems-schema>=$pkgver")

source=("http://repos.fusiondirectory.org/sources/1.0/fusiondirectory/fusiondirectory-plugins-${pkgver}.tar.gz"
"http://repos.fusiondirectory.org/sources/1.0/fusiondirectory/fusiondirectory-${pkgver}.tar.gz")
md5sums=('b5e96dc4deaed932868a809769ef8a71' '5447138f0e37bebd9c2dbed41b787f27')

package() {
cd ./fusiondirectory-plugins-${pkgver}
# Go in plugin directory
cd autofs/

    # Openldap section
    if [ -d ./contrib/openldap ] ; then
      mkdir -p ${pkgdir}/etc/openldap/schema/fusiondirectory/
      mkdir -p ${pkgdir}/usr/share/doc/fusiondirectory-plugin-autofs-schema/
      cp ../../fusiondirectory-${pkgver}/{AUTHORS,Changelog,COPYING} ${pkgdir}/usr/share/doc/fusiondirectory-plugin-autofs-schema/   
 
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
