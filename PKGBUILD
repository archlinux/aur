# Maintainer: Jevgenijs Protopopovs <jevgenij@protopopov.lv>
pkgname='kefir'
pkgver='0.5.1'
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
sha512sums=('a8e324fca4a202fe3a2592f356834db261b6ceca2f419d5067842ed48f07bf6bfe266e75d85676c74ce340fb3ecb6708b395e39959dce62a4db8456abe26eea6')

build () {
    cd kefir-v$pkgver
    make all PROFILE=release KEFIR_BUILD_SOURCE_ID="a0a2f774a9832559c5eac400dff647be3263b618"
}

package () {
    cd kefir-v$pkgver
    make DESTDIR="$pkgdir" prefix="/usr" INSTALL_LICENSES=no install
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
    install -Dm644 dist/README.license "$pkgdir/usr/share/licenses/$pkgname/README"
}
