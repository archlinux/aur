# Maintainer: Adrian Holfter < aholfter PLUS aur AT googlemail DOT com >
pkgname=libcitygml
pkgver=2.5.2
pkgrel=1
pkgdesc='C++ library for parsing CityGML files'
arch=('x86_64')
url='https://github.com/jklimke/libcitygml'
depends=('glu' 'xerces-c' 'gdal')
makedepends=('cmake')
license=('LGPL')
source=("https://github.com/jklimke/libcitygml/archive/v${pkgver}.tar.gz")
sha256sums=('ec3f026697ac749290a48d0fc93a75283e6326b0bade83763b3c375cc7dab0d2')

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

