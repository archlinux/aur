# Maintainer: Florian Dang <florian dot coin at gmail dot com>

pkgname=deal-ii
_realname=dealii
pkgver=8.5.0
pkgrel=1
pkgdesc="An Open Source Finite Element Differential Equations Analysis Library"
arch=("i686" "x86_64")
url="http://www.dealii.org/"
license=('LGPL')
depends=('boost')
optdepends=(
      'arpack: Fortran77 subroutines designed to solve large scale eigenvalue problems'
      'atlas-lapack: Complete LAPACK and BLAS implementation using optimized ATLAS routines'
      'bzip2: A high-quality data compression program'
      'doxygen: A documentation system for C++, C, Java, IDL, and PHP'
      'p4est-deal-ii: The parallel forest (p4est) library, built to work with deal.II'
      'gsl: A modern numerical library for C and C++ programmers'
      'hdf5-openmpi: General purpose library and file format for storing scientific data'
      'intel-tbb: High level abstract threading library'
      'lapack: Linear Algebra PACKage'
      'mathjax: An open source Javascript display engine for mathematics that works in all modern browsers.'
      'metis: partitioning graphs, finite element meshes, fill reducing orderings for sparse matrices.'
      'muparser: A fast math parser library'
      'netcdf-cxx-legacy: Legacy NetCDF C++ bindings'
      'openmpi: High performance message passing library (MPI)'
      'opencascade: Open CASCADE Technology, 3D modeling & numerical simulation'
      'petsc: Portable, extensible toolkit for scientific computation'
      'slepc: Scalable library for Eigenvalue problem computations'
      'trilinos: object-oriented software framework for the solution of large-scale, complex multi-physics engineering and scientific problems'
      'suitesparse: A collection of sparse matrix libraries'
      'zlib: Compression library implementing the deflate compression method found in gzip and PKZIP'
      )
makedepends=('cmake')
install=deal-ii.install
source=(https://github.com/dealii/dealii/releases/download/v$pkgver/${_realname}-$pkgver.tar.gz)
sha1sums=('75076beddfd4a1b590cba9fbc78eea901c7f3ddb')

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

