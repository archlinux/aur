# Maintainer: Jevgenijs Protopopovs <jevgenij@protopopov.lv>
pkgname='kefir'
pkgver='0.3.1'
pkgrel=1
pkgdesc='C17 language compiler for x86_64 systems'
arch=('x86_64')
url='https://kefir.protopopov.lv'
license=('GPL3' 'BSD')

depends=()
makedepends=()
source=("https://git.sr.ht/~jprotopopov/kefir/archive/v$pkgver.tar.gz")
sha512sums=('7c9350d7c87ab5589880919489a6233490314cf64a9c20fb251ba3f8fdecbbb6f0851a69c1c5c87cd01f451f1697c4e1c6715c544fbecf719dc98c75f5d2f21f')

build () {
    cd kefir-v$pkgver
    make all PROFILE=release KEFIR_BUILD_SOURCE_ID="32a41489c8090f9d4877ec26f6387485c2deb8f4"
}

package () {
    cd kefir-v$pkgver
    make DESTDIR="$pkgdir" prefix="/usr" install
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
    install -Dm644 source/runtime/LICENSE "$pkgdir/usr/share/licenses/$pkgname/runtime/LICENSE"
    install -Dm644 dist/README.license "$pkgdir/usr/share/licenses/$pkgname/README"
}
