# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=belle-sip
pkgver=5.4.50
pkgrel=1
pkgdesc="A Voice-over-IP phone"
arch=('x86_64')
url="https://github.com/BelledonneCommunications/belle-sip/"
license=('GPL-3.0-only')
depends=('avahi' 'belr' "bctoolbox>=$pkgver")
makedepends=('cmake')
options=('!emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/BelledonneCommunications/belle-sip/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e4e75df95254dcec4577412b78bece1b2c6a76fe16263b0f360fb1f9a64a160b')

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
