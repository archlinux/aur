# Maintainer: Wes Barnett <wes at w barnett dot us>
pkgname=xerox-workcentre-5945-5955
pkgver=5.433.16.0
pkgrel=2
pkgdesc="Xerox WorkCentre 5945/5955 printer driver for CUPS"
arch=("x86_64")
url="http://www.support.xerox.com/support/workcentre-5945-5955"
source=("http://download.support.xerox.com/pub/drivers/WC5945_WC5955/drivers/win10x64/ar/WC59XX_${pkgver}_PS_x64.exe"
        "xsa.patch"
        "xerox-workcentre-5945-5955.install")
install="xerox-workcentre-5945-5955.install"
license=('custom')
sha512sums=('5eba5e53fda0d7781e11ac1cf3e73a28503a57550fb4ffb8199b8c6bdc708874d37147bc9b75dbea04a438809244e70772166f905ba7e77774fdda139c80ab55'
            'a345da37d596f6e0535ff411f7029781a1368ca2dea86f27649367b322d1db791961893d765603fa56fa2d1e7bf2e38f5c17de483c826188c713e86803c79504'
            '7696cc27724b49e9a562f4c7bee0c9090bd0a343b412644e18feb4b33d548be3b0ac74e300dabd99e2ffc58bdf159a81fb82906bc75fd4c3cfa5eda46ee81675')
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
