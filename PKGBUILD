# Maintainer: Adrian Holfter < aholfter PLUS aur AT googlemail DOT com >
pkgname=libcitygml
pkgver=2.1.0
pkgrel=1
pkgdesc="libcitygml is a small and easy to use open source C++ library for parsing CityGML files in such a way that data can be easily exploited by 3D rendering applications."
arch=('i686' 'x86_64')
url="https://github.com/jklimke/libcitygml"
depends=('glu' 'xerces-c' 'gdal')
makedepends=('cmake')
license=('LGPL')
source=(https://github.com/jklimke/libcitygml/archive/${pkgver}.tar.gz)
md5sums=('6d0d1b2b4b15dd7853331c5fc5b809b3')
build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install

  # remove bin/citygmlcheck binary
  cd $pkgdir
  rm -rf usr/bin
}
