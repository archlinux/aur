
pkgname=xerox-workcentre-5945-5955
pkgver=5.433.16.0
pkgrel=1
pkgdesc="Xerox WorkCentre 5945/5955 printer driver for CUPS"
arch=("x86_64")
url="http://www.support.xerox.com/support/workcentre-5945-5955"
source=("http://download.support.xerox.com/pub/drivers/WC5945_WC5955/drivers/win10x64/ar/WC59XX_${pkgver}_PS_x64.exe"
        "xsa.patch"
        "xerox-workcentre-5945-5955.install")
install="xerox-workcentre-5945-5955.install"
license=('custom')
md5sums=('e829cad2b1d3a70e5dc2dbf52b9245d7'
         '8ca0fd022a9a82fe198c154d743ee821'
         '8da77f2eb9f46061642439bd2f664fbb')
makedepends=('unrar')
depends=('libcups')

prepare() {
    cd ${srcdir}
    unrar e -y WC59XX_${pkgver}_PS_x64.exe WC59XX_${pkgver}_PS_x64_Driver.inf/x2DBRI.ppd
    sed -i 's/Xerox WorkCentre 5955/Xerox WorkCentre 5945\/5955/g' x2DBRI.ppd
    patch < xsa.patch
}

package() {
    cd ${srcdir}
    install -Dm 644 x2DBRI.ppd ${pkgdir}/usr/share/foomatic/db/source/PPD/Xerox/xrx5955.ppd
}
