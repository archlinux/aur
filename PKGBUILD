# Maintainer: orumin <dev at orum.in>

pkgname=lib32-metis
_basename=metis
pkgver=5.1.0.p3
_pkgver=5.1.0-p3
pkgrel=1
arch=(x86_64)
pkgdesc="A set of serial programs for partitioning graphs, partitioning finite element meshes, and producing fill reducing orderings for sparse matrices"
url="http://glaros.dtc.umn.edu/gkhome/metis/metis/overview"
license=(custom)
depends=(lib32-glibc metis)
makedepends=(cmake)
options=(docs)
# source=("http://glaros.dtc.umn.edu/gkhome/fetch/sw/metis/${_basename}-${pkgver}.tar.gz")
source=("http://ftp.mcs.anl.gov/pub/petsc/externalpackages/${_basename}-${_pkgver}.tar.gz")
sha256sums=('5b55e4f955f4416160c82d7a0aa763a94b95548de87867a46e256585a26d833c')

build() {
  cd $_basename-$_pkgver

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  make config shared=1 prefix=/usr
  make
}

package() {
  cd $_basename-$_pkgver

  make install DESTDIR="$pkgdir"

  mv "${pkgdir}"/usr/lib "${pkgdir}"/usr/lib32
  rm -r "${pkgdir}"/usr/include
}
