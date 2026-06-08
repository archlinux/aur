# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=belle-sip
pkgver=5.4.119
pkgrel=1
pkgdesc="A Voice-over-IP phone"
arch=('x86_64')
url="https://github.com/BelledonneCommunications/belle-sip/"
license=('GPL-3.0-only')
depends=('avahi' 'belr' "bctoolbox>=$pkgver")
makedepends=('cmake')
options=('!emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/BelledonneCommunications/belle-sip/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('5a9bd83d6ea1275ab9867507a39830594c9cb46cef2185ff249ab1b6fe797c28')

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
