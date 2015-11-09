# Maintainer: Adrian Holfter < aholfter PLUS aur AT googlemail DOT com >
pkgname=libcitygml
pkgver=2.0
pkgrel=1
pkgdesc="libcitygml is a small and easy to use open source C++ library for parsing CityGML files in such a way that data can be easily exploited by 3D rendering applications."
arch=('i686' 'x86_64')
url="https://github.com/jklimke/libcitygml"
depends=('glu' 'xerces-c' 'gdal')
makedepends=('cmake')
license=('LGPL')
source=(https://github.com/jklimke/libcitygml/archive/v${pkgver}.tar.gz)
md5sums=('7445e1e9976e5cec901ceb4158143bd5')

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
