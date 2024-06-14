pkgname=('med')
pkgver=5.0.0
pkgrel=1
pkgdesc="MED: interoperable format for data interchange between mesh based solvers"
url="https://www.salome-platform.org/downloads"
license=('LGPL-3.0')
depends=('hdf5' 'tk' 'python')
makedepends=('gcc-fortran' 'swig' 'cmake')
optdepends=()
arch=('x86_64')
source=("https://files.salome-platform.org/Salome/medfile/med-${pkgver}.tar.bz2" "hdf5-1.14.patch")
sha256sums=('267e76d0c67ec51c10e3199484ec1508baa8d5ed845c628adf660529dce7a3d4' 'SKIP')

prepare() {
  cd med-${pkgver}
  patch -p1 -i "$srcdir/hdf5-1.14.patch"
}

build() {
  cd med-${pkgver}
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
        -DMEDFILE_BUILD_PYTHON=ON -DMEDFILE_BUILD_TESTS=OFF -DMEDFILE_INSTALL_DOC=OFF .
  make
}

package() {
  cd ${pkgbase}-${pkgver}
  make DESTDIR=${pkgdir} install
}
