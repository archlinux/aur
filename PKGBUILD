# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=belcard
pkgver=4.4.0
pkgrel=1
pkgdesc="A library for working with vCards"
arch=('x86_64')
url="http://www.linphone.org/"
license=('GPL')
depends=('belr>=4.3' 'gcc-libs')
makedepends=('cmake')
source=("belcard-$pkgver.tar.gz::https://github.com/BelledonneCommunications/belcard/archive/$pkgver.tar.gz")
sha256sums=('7283334681eb83b7461446dd3aa21ab97450b7a47a06c5fc1fd24bd9987e0996')

build() {
  mkdir -p build
  cd build
  cmake -DCMAKE_PREFIX_PATH="/usr/lib" \
      -DCMAKE_INSTALL_PREFIX="/usr" \
      -DENABLE_STATIC=NO "../$pkgname-$pkgver"
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}
