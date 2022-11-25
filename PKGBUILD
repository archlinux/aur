# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=belle-sip
pkgver=5.1.71
pkgrel=1
pkgdesc="A Voice-over-IP phone"
arch=('x86_64')
url="https://github.com/BelledonneCommunications/belle-sip/"
license=('GPL3')
depends=('avahi' 'belr' "bctoolbox>=$pkgver")
makedepends=('cmake')
options=('!emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/BelledonneCommunications/belle-sip/archive/$pkgver.tar.gz")
sha256sums=('218728c7c5d32e8e44605982f87a62da0b4068f2678c0fafc96f4d3524002836')

build() {
  cmake -B build "$pkgname-$pkgver" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DENABLE_STATIC=NO \
        -DENABLE_MDNS=YES \
        -DENABLE_STRICT=YES \
        -DENABLE_TESTS=NO
  make -C build
}

package() {
  make DESTDIR="$pkgdir" -C build install
}
