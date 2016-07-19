# Maintainer: MartiMcFly martimcfly@autorisation.de
# Contributor: C Anthony Risinger
# Contributer: Jörg Thalheim <joerg@higgsboson.tk>

pkgname=z-push
groups=('zarafa')
pkgver=2.2.8
pkgrel=72
pkgdesc="open-source implementation of the ActiveSync protocol"
arch=('any')
url="http://z-push.sf.net/"
license=('AGPL3')
depends=('php<7'
	 'php-fpm<7')
optdepends=('nginx'
	    'apache'
	    'zarafa-server')
install='install'
backup=('etc/webapps/z-push/nginx-location.conf'
	'etc/php/conf.d/z-push.ini'
	'etc/php/fpm.d/z-push.conf')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::http://download.z-push.org/final/2.2/${pkgname}-${pkgver}.tar.gz"
        "apache.example.conf"
        "htaccess"
	"z-push.ini"
	"z-push.conf"
	"nginx-location.conf"
	"nginx-ssl.example.conf"
	"php-fpm.example.conf"
	"z-push-admin"
	"z-push-top")

md5sums=('e55b04680bb9c698301155c47aeb87f8'
         '32a459bd61135b6c5e99e82e3a6b0007'
         '1091aa1ba272ef05bf628f73b05c527a'
         'fee38ae6ba98ae7afcb49b1edbc31d8e'
         'b61c194ee4e3e3bf8bfa6a72e6f38019'
         '9637d4164f85cb3fb9a886654645a46c'
         '1bdab5b1e4473c1b0f6ce2e5c8f1da61'
         '7adcf5e023718421a5e8e07e5e9a2480'
         '626a81889bebd6184d8f90deb00f6119'
         'dfa0d3eceef2433ded6229b6611c5e02')

package() {
    # according to https://wiki.archlinux.org/index.php/Web_application_package_guidelines
    mkdir -p ${pkgdir}/usr/share/webapps/z-push
    cp -r ${srcdir}/${pkgname}-${pkgver}/* ${pkgdir}/usr/share/webapps/z-push/
    cp ${srcdir}/htaccess ${pkgdir}/usr/share/webapps/z-push/.htaccess
    rm ${pkgdir}/usr/share/webapps/z-push/config.php

    mkdir -p ${pkgdir}/usr/bin
    cp ${srcdir}/z-push-admin ${pkgdir}/usr/bin
    cp ${srcdir}/z-push-top ${pkgdir}/usr/bin
    
    mkdir -p ${pkgdir}/etc/webapps/z-push
    cp ${srcdir}/apache.example.conf ${pkgdir}/etc/webapps/z-push/
    cp ${srcdir}/php-fpm.example.conf ${pkgdir}/etc/webapps/z-push/
    cp ${srcdir}/nginx-ssl.example.conf ${pkgdir}/etc/webapps/z-push/
    cp ${srcdir}/nginx-location.conf ${pkgdir}/etc/webapps/z-push/
    cp ${srcdir}/${pkgname}-${pkgver}/config.php ${pkgdir}/etc/webapps/z-push/config.example.php
    ln -s /etc/webapps/z-push/config.php ${pkgdir}/usr/share/webapps/z-push/config.php
    
    mkdir -p ${pkgdir}/etc/php/conf.d
    cp ${srcdir}/z-push.ini ${pkgdir}/etc/php/conf.d

    mkdir -p ${pkgdir}/etc/php/fpm.d
    cp ${srcdir}/z-push.conf ${pkgdir}/etc/php/fpm.d

    mkdir -p ${pkgdir}/var/log/z-push
}
