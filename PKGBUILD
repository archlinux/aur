# Maintainer: Florian Dang <florian dot coin at gmail dot com>

pkgname=deal-ii
_realname=dealii
pkgver=8.4.0
pkgrel=1
pkgdesc="An Open Source Finite Element Differential Equations Analysis Library"
arch=("i686" "x86_64")
url="http://www.dealii.org/"
license=('LGPL')
depends=('boost')
optdepends=(
      'lapack: Linear Algebra PACKage' 
      'openmpi: High performance message passing library (MPI)'
      'petsc: Portable, extensible toolkit for scientific computation'
      'slepc: Scalable library for Eigenvalue problem computations'
      'mumps: Sparse solver library using Gaussian elimination'
      'intel-tbb: High level abstract threading library'
      'trilinos: object-oriented software framework for the solution of large-scale, complex multi-physics engineering and scientific problems'
      'metis: partitioning graphs, finite element meshes, fill reducing orderings for sparse matrices.'
      )
makedepends=('cmake')
install=deal-ii.install
source=(https://github.com/dealii/dealii/releases/download/v$pkgver/${_realname}-$pkgver.tar.gz)
# source=(https://dealii.googlecode.com/files/${_realname}-$pkgver.tar.gz)
sha1sums=('559ef06969da4a35600adee38195f1b8be929721')

build() {
  # cd "${srcdir}/${_realname}-$pkgver"
  rm -rf "${srcdir}/build"
  mkdir "${srcdir}/build"
  cd "${srcdir}/build"

  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/ ../${_realname}-$pkgver

  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install

  # doc
  #install -d "${pkgdir}/usr/share/doc/"
  #mv "${srcdir}/${_realname}/doc/" "${pkgdir}/usr/share/doc/${_realname}"

  # examples and README
  #mv "${pkgdir}/usr/${_realname}/examples/" "${pkgdir}/usr/share/doc/${_realname}"
  #mv "${pkgdir}/usr/${_realname}/README" "${pkgdir}/usr/share/doc/${_realname}"

  # remove unnecessary stuffs in pkgbuild
  #rm -rf "${pkgdir}/usr/${_realname}/cmake" "${pkgdir}/usr/${_realname}/common/"

  install -D -m644 "${srcdir}/${_realname}-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/${_realname}-$pkgver/LICENSE"
}

