# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=belle-sip
pkgver=5.3.5
pkgrel=1
pkgdesc="A Voice-over-IP phone"
arch=('x86_64')
url="https://github.com/BelledonneCommunications/belle-sip/"
license=('GPL3')
depends=('avahi' 'belr' "bctoolbox>=$pkgver")
makedepends=('cmake')
options=('!emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/BelledonneCommunications/belle-sip/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('304c00f321af78e1617e7cc8213f3d57a5b39d6be4b4461711df0e6bc9b6d47a')

build() {
  cmake -B build "$pkgname-$pkgver" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_SHARED_LIBS=YES \
        -DENABLE_MDNS=YES \
        -DENABLE_STRICT=YES \
        -DENABLE_UNIT_TESTS=NO
  make -C build
}

package() {
  make DESTDIR="$pkgdir" -C build install
}
