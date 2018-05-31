pkgname=fusiondirectory-plugin-fai-schema
pkgver=1.2.1
pkgver=1.2.1
pkgrel=1
pkgdesc="LDAP schema for FusionDirectory fai plugin"
arch=("any")
url="http://fusiondirectory.org/"
license=("GPL")

depends=("fusiondirectory-schema>=$pkgver" "fusiondirectory-plugin-systems-schema>=$pkgver" "fusiondirectory-plugin-argonaut-schema>=$pkgver")

source=("http://repos.fusiondirectory.org/sources/1.0/fusiondirectory/fusiondirectory-plugins-${pkgver}.tar.gz"
"http://repos.fusiondirectory.org/sources/1.0/fusiondirectory/fusiondirectory-${pkgver}.tar.gz")
md5sums=('7fef67005c308da8a20918a5220d29b2' '839d334fd2fb9817c070e855cc9f1a37')

package() {
cd ./fusiondirectory-plugins-${pkgver}
# Go in plugin directory
cd fai/

    # Openldap section
    if [ -d ./contrib/openldap ] ; then
      mkdir -p ${pkgdir}/etc/openldap/schema/fusiondirectory/
      mkdir -p ${pkgdir}/usr/share/doc/fusiondirectory-plugin-fai-schema/
      cp ../../fusiondirectory-${pkgver}/{AUTHORS,Changelog,COPYING} ${pkgdir}/usr/share/doc/fusiondirectory-plugin-fai-schema/   
 
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
