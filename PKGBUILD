# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=beachmat.hdf5
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="beachmat bindings for HDF5-backed matrices"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-beachmat
  r-delayedarray
  r-hdf5array
  r-rcpp
  zlib
)
makedepends=(
  r-rhdf5lib
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rhdf5
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('54b709d85197696ae959603ea5d730ea')
b2sums=('7d4715ea544ed0db6e74dcdd35e6393d5e0c150017038c08a6cae779c81af7c1023c70accbe599c309a5e376b3bad96a67b1df575ea221b445ed37bd471bd745')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
