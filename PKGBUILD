# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=belle-sip
pkgver=5.2.32
pkgrel=1
pkgdesc="A Voice-over-IP phone"
arch=('x86_64')
url="https://github.com/BelledonneCommunications/belle-sip/"
license=('GPL3')
depends=('avahi' 'belr' "bctoolbox>=$pkgver")
makedepends=('cmake')
options=('!emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/BelledonneCommunications/belle-sip/archive/$pkgver.tar.gz")
sha256sums=('23f5c6f4b6632092ebdcaeb3ff36d5992d1e522ea6c11702879cdc12ea8dd82f')

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
