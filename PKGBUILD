pkgname=fusiondirectory-plugin-dns-schema
pkgver=1.0.8.9
pkgver=1.0.8.9
pkgrel=1
pkgdesc="LDAP schema for FusionDirectory dns plugin"
arch=('any')
url="http://fusiondirectory.org/"
license=('LGPL')

depends=("fusiondirectory-schema>=$pkgver" "fusiondirectory-plugin-systems>=$pkgver" "fusiondirectory-plugin-argonaut-schema>=$pkgver")

install=fusiondirectory-plugin-dns.install
source=("http://repos.fusiondirectory.org/sources/1.0/fusiondirectory/fusiondirectory-plugins-${pkgver}.tar.gz"
"http://repos.fusiondirectory.org/sources/1.0/fusiondirectory/fusiondirectory-${pkgver}.tar.gz")
md5sums=('03d3831e2c50248e3cc9e7cefe223234'
'e169b4ca7ac809a6b939ed06d81c0f2a')

package() {
cd ./fusiondirectory-plugins-${pkgver}
# Go in plugin directory
cd dns/

    # Openldap section
    if [ -d ./contrib/openldap ] ; then
      mkdir -p ${pkgdir}/etc/openldap/schema/fusiondirectory/
      mkdir -p ${pkgdir}/usr/share/doc/fusiondirectory-plugin-dns-schema/
      cp ../../fusiondirectory-${pkgver}/{AUTHORS,Changelog,COPYING} ${pkgdir}/usr/share/doc/fusiondirectory-plugin-dns-schema/   
 
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
