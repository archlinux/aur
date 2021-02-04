# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=belle-sip
pkgver=4.4.26
pkgrel=1
pkgdesc="A Voice-over-IP phone"
arch=('x86_64')
url="https://github.com/BelledonneCommunications/belle-sip/"
license=('GPL3')
depends=('avahi' "bctoolbox>=$pkgver")
makedepends=('cmake')
options=('!emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/BelledonneCommunications/belle-sip/archive/$pkgver.tar.gz")
sha256sums=('67faf551011a17f191ac00aaa415e59f6133d6282bf5e15d239289ff25359de1')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DENABLE_STATIC=NO \
        -DENABLE_MDNS=YES \
        -DENABLE_STRICT=YES \
        -DENABLE_TESTS=NO .
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
