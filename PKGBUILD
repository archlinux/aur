pkgname=libmesh
pkgrel=1
pkgver=1.3.0
pkgdesc="A C++ Finite Element Library"
arch=("x86_64")
url="http://libmesh.github.io/"
license=('LGPL')
depends=('eigen' 'hdf5' 'boost-libs' 'intel-tbb' 'vtk' 'glpk' 'netcdf' 'nlopt')
makedepends=('bison')
source=("https://github.com/libMesh/libmesh/releases/download/v${pkgver}/libmesh-${pkgver}.tar.bz2")
sha256sums=('a8cc2cd44f42b960989dba10fa438b04af5798c46db0b4ec3ed29591b8359786')

build() {
  cd "${srcdir}/libmesh-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/libmesh-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -r "${pkgdir}"/usr/{contrib,examples}
  rm "${pkgdir}"/usr/Make.common "${pkgdir}"/usr/etc/libmesh/Make.common
  rm -r "${pkgdir}"/usr/etc/
}
