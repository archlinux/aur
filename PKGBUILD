# Maintainer: Jevgenijs Protopopovs <jevgenij@protopopov.lv>
pkgname='kefir'
pkgver='0.5.0'
pkgrel='1'
pkgdesc='C17/C23 language compiler for x86_64 systems'
arch=('x86_64')
provides=('kefir' 'kefir-debug')
conflicts=('kefir' 'kefir-debug')
url='https://kefir.protopopov.lv'
license=('GPL3' 'BSD')

depends=()
makedepends=()
source=("https://git.sr.ht/~jprotopopov/kefir/archive/v$pkgver.tar.gz")
sha512sums=('93cc6c2b66addbe817ac30a1ec38ed242ad829ae61601fa024ae1765698a263001c2a078487e8e786690e93a1dc19b0d135ad43fcf54fdda7327e7a3222c1cb3')

build () {
    cd kefir-v$pkgver
    make all PROFILE=release KEFIR_BUILD_SOURCE_ID="080078d9d6b2000c53f377be36398377a8d18cd6"
}

package () {
    cd kefir-v$pkgver
    make DESTDIR="$pkgdir" prefix="/usr" INSTALL_LICENSES=no install
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
    install -Dm644 dist/README.license "$pkgdir/usr/share/licenses/$pkgname/README"
}
