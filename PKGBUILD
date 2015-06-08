# Maintainer: MartiMcFly martimcfly@autorisation.de
# Contributor: C Anthony Risinger
# Contributer: Jörg Thalheim <joerg@higgsboson.tk>

pkgname=z-push
pkgver=2.2.1
_pkgrev=1939
pkgrel=3
pkgdesc="open-source implementation of the ActiveSync protocol"
arch=('any')
url="http://z-push.sf.net/"
license=('AGPL3')
depends=('php')
optdepends=('php-fpm'
	    'nginx'
	    'apache'
	    'zarafa-server')
install=('install')
backup=('etc/webapps/z-push/nginx-location.conf'
	'etc/php/conf.d/z-push.ini'
	'etc/php/fpm.d/z-push.conf')
options=('!strip')
source=("${pkgname}-${pkgver}-${_pkgrev}.tar.gz::http://download.z-push.org/final/2.2/${pkgname}-${pkgver}-${_pkgrev}.tar.gz"
        "apache.example.conf"
        "htaccess"
	"z-push.ini"
	"z-push.conf"
	"nginx-location.conf"
	"nginx-ssl.example.conf"
	"php-fpm.example.conf")

md5sums=('6c0e968c1ca07ec65824193d01c016b9'
         '32a459bd61135b6c5e99e82e3a6b0007'
         '1091aa1ba272ef05bf628f73b05c527a'
         '6e87a175d15fce77264ae87ed016b223'
         'b61c194ee4e3e3bf8bfa6a72e6f38019'
         '9637d4164f85cb3fb9a886654645a46c'
         '73451bc5c35072b22b0b2925c5920978'
         '7adcf5e023718421a5e8e07e5e9a2480')

package() {
    # according to https://wiki.archlinux.org/index.php/Web_application_package_guidelines
    mkdir -p ${pkgdir}/usr/share/webapps/z-push
    cp -r ${srcdir}/${pkgname}-${pkgver}-${_pkgrev}/* ${pkgdir}/usr/share/webapps/z-push/
    cp ${srcdir}/htaccess ${pkgdir}/usr/share/webapps/z-push/.htaccess
    rm ${pkgdir}/usr/share/webapps/z-push/config.php

    mkdir -p ${pkgdir}/etc/webapps/z-push
    cp ${srcdir}/apache.example.conf ${pkgdir}/etc/webapps/z-push/
    cp ${srcdir}/php-fpm.example.conf ${pkgdir}/etc/webapps/z-push/
    cp ${srcdir}/nginx-ssl.example.conf ${pkgdir}/etc/webapps/z-push/
    cp ${srcdir}/nginx-location.conf ${pkgdir}/etc/webapps/z-push/
    cp ${srcdir}/${pkgname}-${pkgver}-${_pkgrev}/config.php ${pkgdir}/etc/webapps/z-push/config.example.php
    ln -s /etc/webapps/z-push/config.php ${pkgdir}/usr/share/webapps/z-push/config.php

    mkdir -p ${pkgdir}/etc/php/conf.d
    cp ${srcdir}/z-push.ini ${pkgdir}/etc/php/conf.d

    mkdir -p ${pkgdir}/etc/php/fpm.d
    cp ${srcdir}/z-push.conf ${pkgdir}/etc/php/fpm.d

    mkdir -p ${pkgdir}/var/{lib,log}/z-push
}
