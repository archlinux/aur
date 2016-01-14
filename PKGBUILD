# Maintainer: Markus Moser<marmoser@wu.ac.at>
pkgname=openacs
pkgver=5.9.0
pkgrel=1
pkgdesc="a toolkit for building scalable, community-oriented web applications."
arch=('x86_64')
url="http://www.openacs.org"
license=('GPL')
depends=('tcllib>=1.17' 'tcl>=8.5.18' 'postgresql>=9.4' 'tdom>=0.8.3' 'nsf>=2.0.0-1' 'naviserver>=4.99.8' 'naviserver-postgres-connector>=4.99.8' 'naviserver-tclthread>=2.7.2' 'systemd')
source=("http://openacs.org/projects/openacs/download/download/${pkgname}-${pkgver}.tar.gz?revision_id=4869825"
"openacs.service"
"config-oacs-${pkgver}.tcl" )
md5sums=("8ed8d374fe1995644d0bfb9e265d7a0c"
"c838dfeeee8398c531f88eb218e49244"
"b7d70f60b1b92b5d6714d4d8ccb39e3d")

package() {
    install="${pkgname}.install"
    #copy the content first
    mkdir -p ${pkgdir}/usr/lib/${pkgname}
    cp -dr "${srcdir}/${pkgname}-${pkgver}/." "${pkgdir}/usr/lib/${pkgname}/"
    #systemd service
    install -m 644 -D "${srcdir}/openacs.service" "${pkgdir}/usr/lib/systemd/system/openacs.service"
    #prepare config file
    install -m 644 -D "${srcdir}/config-oacs-${pkgver}.tcl" "${pkgdir}/etc/naviserver/config-oacs-${pkgver}.tcl"
}
