# Maintainer: Stefan Biereigel <stefan@biereigel.de>

pkgname=csxcad-git
pkgver=v0.6.3.r2.gc6a1587
pkgrel=1
pkgdesc="A C++ library to describe geometrical objects and their physical or non-physical properties."
url="https://github.com/thliebig/CSXCAD"
arch=('i686' 'x86_64')
license=('LGPL3')
depends=('fparser' 'qt5-webkit' 'glew' 'proj' 'libharu' 'tinyxml' 'hdf5' 'vtk' 'boost' 'cgal' 'nlohmann-json')
makedepends=('cmake' 'cython')
provides=('csxcad')
conflicts=('csxcad')

source=(git+https://github.com/thliebig/CSXCAD 'fix-libdir.patch')
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/CSXCAD"
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd CSXCAD
  patch -Np1 -i ../fix-libdir.patch
}

build() {
  cd "$srcdir/CSXCAD"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir} ../
  make
}

package() {
  cd "$srcdir/CSXCAD/build"
  make install
}
