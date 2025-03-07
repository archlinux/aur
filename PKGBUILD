pkgname=medcoupling
pkgver=9.14.0
pkgrel=1
pkgdesc="Field data manipulation library"
url="https://www.salome-platform.org"
license=('LGPL2+')
depends=('med' 'libxml2' 'python-scipy' 'metis' 'scotch')
makedepends=('swig' 'salome-configuration' 'boost' 'git')
arch=('x86_64')
source=("git+https://github.com/SalomePlatform/medcoupling.git#tag=V${pkgver//\./_}")
md5sums=('SKIP')

build() {
  cd medcoupling
  cmake -S medcoupling \
    -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release \
    -DCONFIGURATION_ROOT_DIR=/usr/share/salome/configuration \
    -DMEDCOUPLING_BUILD_DOC=OFF -DMEDCOUPLING_BUILD_TESTS=OFF \
    -DMEDCOUPLING_PARTITIONER_METIS=ON -DMEDCOUPLING_PARTITIONER_PARMETIS=ON \
    -DMEDCOUPLING_USE_64BIT_IDS=OFF \
    -DMEDCOUPLING_PARTITIONER_SCOTCH=ON -DMEDCOUPLING_INSTALL_CMAKE_LOCAL=/usr/lib/cmake \
    -B build .
   make -C build
}

package() {
  make DESTDIR=${pkgdir} install -C medcoupling/build
  rm -r "${pkgdir}"/usr/tests
  rm -r "${pkgdir}"/usr/bin/__pycache__
}
