pkgname=fusiondirectory-plugin-opsi-schema
pkgver=1.0.11
pkgver=1.0.11
pkgrel=1
pkgdesc="LDAP schema for FusionDirectory opsi plugin"
arch=("any")
url="http://fusiondirectory.org/"
license=("LGPL")

depends=("fusiondirectory-schema>=$pkgver" "fusiondirectory-plugin-systems-schema>=$pkgver" "fusiondirectory-plugin-dns-schema>=$pkgver" "fusiondirectory-plugin-argonaut-schema>=$pkgver" "fusiondirectory-plugin-samba-schema>=$pkgver")

source=("http://repos.fusiondirectory.org/sources/1.0/fusiondirectory/fusiondirectory-plugins-${pkgver}.tar.gz"
"http://repos.fusiondirectory.org/sources/1.0/fusiondirectory/fusiondirectory-${pkgver}.tar.gz")
md5sums=('e3b8df83899c46e3107c56e090e2f17b' '5046dccfdf0713f0ddd72dc076f615ee')

package() {
cd ./fusiondirectory-plugins-${pkgver}
# Go in plugin directory
cd opsi/

    # Openldap section
    if [ -d ./contrib/openldap ] ; then
      mkdir -p ${pkgdir}/etc/openldap/schema/fusiondirectory/
      mkdir -p ${pkgdir}/usr/share/doc/fusiondirectory-plugin-opsi-schema/
      cp ../../fusiondirectory-${pkgver}/{AUTHORS,Changelog,COPYING} ${pkgdir}/usr/share/doc/fusiondirectory-plugin-opsi-schema/   
 
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
