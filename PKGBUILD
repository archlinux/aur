# Maintainer: Jevgenijs Protopopovs <jevgenij@protopopov.lv>
pkgname='kefir'
pkgver='0.4.1'
pkgrel='1'
pkgdesc='C17 language compiler for x86_64 systems'
arch=('x86_64')
provides=('kefir' 'kefir-debug')
conflicts=('kefir' 'kefir-debug')
url='https://kefir.protopopov.lv'
license=('GPL3' 'BSD')

depends=()
makedepends=()
source=("https://git.sr.ht/~jprotopopov/kefir/archive/v$pkgver.tar.gz")
sha512sums=('37158efc3fb98f0e501e64babffeb8ad86dc663cf5ebfdcbfceeff77b7785b784289ec83ee22d395d73babb156070441fee4bc05aaf52e17f00aed72685cafe1')

build () {
    cd kefir-v$pkgver
    make all PROFILE=release KEFIR_BUILD_SOURCE_ID="c2f2ffa4ffeee1ca415732260f5902f1151a4614"
}

package () {
    cd kefir-v$pkgver
    make DESTDIR="$pkgdir" prefix="/usr" INSTALL_LICENSES=no install
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
    install -Dm644 dist/README.license "$pkgdir/usr/share/licenses/$pkgname/README"
}
