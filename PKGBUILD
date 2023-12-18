# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=belle-sip
pkgver=5.2.112
pkgrel=1
pkgdesc="A Voice-over-IP phone"
arch=('x86_64')
url="https://github.com/BelledonneCommunications/belle-sip/"
license=('GPL3')
depends=('avahi' 'belr' "bctoolbox>=$pkgver")
makedepends=('cmake')
options=('!emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/BelledonneCommunications/belle-sip/archive/$pkgver.tar.gz")
sha256sums=('d59cdb0a45f616aa4d9a1e12d6d7f0bcee24958b1f694d59af3b4b4ef955178e')

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
