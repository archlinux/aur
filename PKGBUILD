# Maintainer: Adrian Holfter < aholfter PLUS aur AT googlemail DOT com >
pkgname=libcitygml
pkgver=2.5.3
pkgrel=1
pkgdesc='C++ library for parsing CityGML files'
arch=('x86_64')
url='https://github.com/jklimke/libcitygml'
depends=('glu' 'xerces-c' 'gdal')
makedepends=('cmake')
license=('LGPL')
source=("https://github.com/jklimke/libcitygml/archive/v${pkgver}.tar.gz")
sha256sums=('49e4ad5a767ba5ce0eb95fbb6db9d75ea0370c1a735af123aed3a66c6a5a44d3')

build() {
  cmake \
    -B build \
    -S "$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

check() {
  cd build
  bin/citygmltest "$srcdir/$pkgname-$pkgver/data/b1_lod2_cs_w_sem.gml"
  bin/citygmltest "$srcdir/$pkgname-$pkgver/data/b1_lod2_s.gml"
  bin/citygmltest "$srcdir/$pkgname-$pkgver/data/berlin_open_data_sample_data.citygml"
  bin/citygmltest "$srcdir/$pkgname-$pkgver/data/FZK-Haus-LoD0-KIT-IAI-KHH-B36-V1.gml"
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # remove bin/citygmltest binary
  cd $pkgdir
  rm -rf usr/bin
}

