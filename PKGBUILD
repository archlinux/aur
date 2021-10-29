# Maintainer: Adrian Holfter < aholfter PLUS aur AT googlemail DOT com >
pkgname=libcitygml
pkgver=2.3.0
pkgrel=1
pkgdesc="libcitygml is a small and easy to use open source C++ library for parsing CityGML files in such a way that data can be easily exploited by 3D rendering applications."
arch=('i686' 'x86_64')
url="https://github.com/jklimke/libcitygml"
depends=('glu' 'xerces-c' 'gdal')
makedepends=('cmake')
license=('LGPL')
source=(https://github.com/jklimke/libcitygml/archive/${pkgver}.tar.gz)
md5sums=('211f391327bf97e9288e5f2c6051a047')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

check() {
  cd "$srcdir/${pkgname}-${pkgver}"
  bin/citygmltest data/b1_lod2_cs_w_sem.gml
  bin/citygmltest data/b1_lod2_s.gml
  bin/citygmltest data/berlin_open_data_sample_data.citygml
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install

  # remove bin/citygmltest binary
  cd $pkgdir
  rm -rf usr/bin
}
