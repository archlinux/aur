# Maintainer: Markus Moser<marmoser@wu.ac.at>
pkgname=openacs
pkgver=5.10.0
pkgrel=1
pkgdesc="a toolkit for building scalable, community-oriented web applications."
arch=('x86_64')
url="http://www.openacs.org"
license=('GPL')
depends=('tcllib>=1.17' 'tcl>=8.5.18' 'postgresql>=9.4' 'tdom>=0.8.3' 'nsf>=2.0.0-1' 'naviserver>=4.99.22' 'naviserver-postgres-connector>=4.99.22' 'naviserver-tclthread>=2.7.2' 'systemd')
source=("https://openacs.org/projects/openacs/download/download/${pkgname}-full-${pkgver}.tar.gz?revision_id=5537440"
"openacs.service"
"config-oacs-${pkgver}.tcl"
)
md5sums=("9f87a173ee633ece699fe45bfa9ad457"
"3aed4279d9ed730c8c591f00a6dbca45"
"4c4d7fa8782187c6852e17aff2b2dd3b"
)
  
package() {
    install="${pkgname}.install"
    #copy the content first
    mkdir -p ${pkgdir}/usr/lib/${pkgname}
    cp -dr "${srcdir}/${pkgname}-full-${pkgver}/." "${pkgdir}/usr/lib/${pkgname}/"
    #systemd service
    install -m 644 -D "${srcdir}/openacs.service" "${pkgdir}/usr/lib/systemd/system/openacs.service"
    #prepare config file
    install -m 644 -D "${srcdir}/config-oacs-${pkgver}.tcl" "${pkgdir}/etc/naviserver/config-oacs-${pkgver}.tcl"
}
