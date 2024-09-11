# Maintainer: Jevgenijs Protopopovs <jevgenij@protopopov.lv>
pkgname='kefir'
pkgver='0.4.0'
pkgrel='1'
pkgdesc='C17 language compiler for x86_64 systems'
arch=('x86_64')
url='https://kefir.protopopov.lv'
license=('GPL3' 'BSD')

depends=()
makedepends=()
source=("https://git.sr.ht/~jprotopopov/kefir/archive/v$pkgver.tar.gz")
sha512sums=('8f77d4b4a2d41d44cc386dd6178de81bd414650540673851f14e60508108412b21b4155e30c6dde137faa67c81b88b25d3a2799141a1964c16457fbf7b1cfaa8')

build () {
    cd kefir-v$pkgver
    make all PROFILE=release KEFIR_BUILD_SOURCE_ID="ec9fc1c2cbab3e2aa44ac943dcf069a1e22497d0"
}

package () {
    cd kefir-v$pkgver
    make DESTDIR="$pkgdir" prefix="/usr" INSTALL_LICENSES=no install
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
    install -Dm644 source/runtime/LICENSE "$pkgdir/usr/share/licenses/$pkgname/runtime/LICENSE"
    install -Dm644 dist/README.license "$pkgdir/usr/share/licenses/$pkgname/README"
}