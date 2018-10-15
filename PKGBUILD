pkgname=libmesh
pkgrel=1
pkgver=1.3.1
pkgdesc="A C++ Finite Element Library"
arch=("x86_64")
url="http://libmesh.github.io/"
license=('LGPL')
depends=('eigen' 'hdf5' 'boost-libs' 'intel-tbb' 'vtk' 'glpk' 'netcdf' 'nlopt')
makedepends=('bison')
source=("https://github.com/libMesh/libmesh/releases/download/v${pkgver}/libmesh-${pkgver}.tar.bz2")
sha256sums=('638cf30d05c249315760f16cbae4804964db8857a04d5e640f37617bef17ab0f')

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
