pkgname=libmesh
pkgrel=1
pkgver=1.1.0
pkgdesc="A C++ Finite Element Library"
arch=("i686" "x86_64")
url="http://libmesh.github.io/"
license=('LGPL')
depends=('eigen' 'hdf5' 'boost-libs' 'intel-tbb' 'vtk' 'glpk' 'netcdf' 'nlopt')
makedepends=('bison')
source=("https://github.com/libMesh/libmesh/releases/download/v${pkgver}/libmesh-${pkgver}.tar.bz2")
sha1sums=('4408da93833a0381adf11a288177e4eafa72f47c')

build() {
  cd "${srcdir}/libmesh-${pkgver}"
  # https://github.com/libMesh/libmesh/pull/1173 ??
  sed -i "s|InsertNextTupleValue|InsertNextTuple|g" src/mesh/vtk_io.C

  # disable netcdf because of hdf5: https://github.com/libMesh/libmesh/issues/1199
  ./configure --prefix=/usr --disable-netcdf
  make
}

package() {
  cd "${srcdir}/libmesh-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
