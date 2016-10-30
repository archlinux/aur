# Maintainer: Jonathan <greenbigfrog@gmail.com>
pkgname=okcash
pkgver=4.0.0.3
pkgcodename=Utopia
pkgrel=1
pkgdesc="Okcash Qt Wallet"
arch=('i686' 'x86_64')
url="http://okcash.co"
license=('MIT')
makedepends=('git' 'boost')
depends=('boost-libs' 'openssl')
optdepends=(
    'miniupnpc: adds UPnP'
    'qrencode: adds qr code functionality'
)
provides=('okcash')
conflicts=('okcash')
source=("https://github.com/okcashpro/okcash/archive/v$pkgver-core.$pkgcodename.zip")
md5sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}-$pkgver-core.$pkgcodename/"
    qmake
    make
}

package() {
    cd "${srcdir}/${pkgname}-$pkgver-core.$pkgcodename/"
    install -Dm755 "okcash" "${pkgdir}/usr/bin/okcash"
    install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/okcash/LICENSE"
    install -d "${pkgdir}/usr/share/doc/okcash"
    cp -a "doc/" "${pkgdir}/usr/share/doc/okcash/"
    mkdir "${pkgdir}/usr/share/applications"
    mkdir "${pkgdir}/usr/share/pixmaps"
    install -Dm755 "linux-desktop/okcash.desktop" "${pkgdir}/usr/share/applications/"
    install -Dm755 "linux-desktop/okcash.png" "${pkgdir}/usr/share/pixmaps/"
}
