# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=belcard
pkgver=5.4.50
pkgrel=1
pkgdesc="A library for working with vCards"
arch=('x86_64')
url="http://www.linphone.org/"
license=('GPL')
depends=("belr>=$pkgver" 'gcc-libs')
makedepends=('cmake')
source=("belcard-$pkgver.tar.gz::https://github.com/BelledonneCommunications/belcard/archive/$pkgver.tar.gz")
sha256sums=('42fbadbc02dcb4d13772c97abf83ac97ad2aac768b1dec27cf42096dd5e37e41')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
      -DCMAKE_PREFIX_PATH="/usr/lib" \
      -DCMAKE_INSTALL_PREFIX="/usr" \
      -DBUILD_SHARED_LIBS=YES \
      -DENABLE_UNIT_TESTS=NO
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
