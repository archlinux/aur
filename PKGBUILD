# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=belcard
pkgver=5.2.73
pkgrel=1
pkgdesc="A library for working with vCards"
arch=('x86_64')
url="http://www.linphone.org/"
license=('GPL')
depends=("belr>=$pkgver" 'gcc-libs')
makedepends=('cmake')
source=("belcard-$pkgver.tar.gz::https://github.com/BelledonneCommunications/belcard/archive/$pkgver.tar.gz")
sha256sums=('3cea0f7168d62061b75dd2e6d187b053df596493003a960d896f2880b6c0d697')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
      -DCMAKE_PREFIX_PATH="/usr/lib" \
      -DCMAKE_INSTALL_PREFIX="/usr" \
      -DENABLE_STATIC=NO \
      -DENABLE_UNIT_TESTS=NO
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
