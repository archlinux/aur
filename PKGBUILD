# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=belle-sip
pkgver=5.1.10
pkgrel=1
pkgdesc="A Voice-over-IP phone"
arch=('x86_64')
url="https://github.com/BelledonneCommunications/belle-sip/"
license=('GPL3')
depends=('avahi' 'belr' "bctoolbox>=$pkgver")
makedepends=('cmake')
options=('!emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/BelledonneCommunications/belle-sip/archive/$pkgver.tar.gz")
sha256sums=('8b163a4238f753cfa9d7cd0296d777b4f6638da7d5b86174bd8fa7737ecb6207')

build() {
  cmake -B build "$pkgname-$pkgver" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DENABLE_STATIC=NO \
        -DENABLE_MDNS=YES \
        -DENABLE_STRICT=YES \
        -DENABLE_TESTS=NO .
  make -C build
}

package() {
  make DESTDIR="$pkgdir" -C build install
}
