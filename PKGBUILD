# Maintainer: Michael Gisbers <arch@mylinuxtime.de>

pkgname=starcupdrv
pkgver=3.5.0
pkgrel=1
pkgdesc="CUPS Printer Driver for Star Printer"
url="http://www.starmicronics.com"
license=('LGPL')
depends=('libcups')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::http://www.starmicronics.com/support/download.aspx?type=1&tabText=Linux%20CUPS%20Driver%20V3.5.0&path=DriverFolder\drvr\starcupsdrv-3.5.0_linux_20150120.tar.gz&id=599&referrer=http://www.starmicronics.com/support/")
md5sums=('1eb47097feadeefd1c6c4dab169c8329')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}_linux/SourceCode"
    tar xvzf starcupsdrv-src-${pkgver}.tar.gz
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}_linux/SourceCode/starcupsdrv"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}_linux/SourceCode/starcupsdrv/install"
    install -d "${pkgdir}/usr/share/cups/model/" "${pkgdir}/usr/lib/cups/filter"
    install *.ppd.gz "${pkgdir}/usr/share/cups/model/"
    install rastertostar* "${pkgdir}/usr/lib/cups/filter"
}
