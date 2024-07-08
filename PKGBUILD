# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=hdf5r
_pkgver=1.3.11
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interface to the 'HDF5' Binary Data Format"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('Apache-2.0')
depends=(
  hdf5
  r-bit64
  r-r6
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-formatr
  r-knitr
  r-nycflights13
  r-reshape2
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3cc2909d1f4e7c73b46c7273573ac69b')
b2sums=('68808fd7f73b5adec411c6f480813a2c02b435baa8a9ce08c61cca1018f1bcd5351794e51b69fc8334a9e05d69df49f38c6727af1f5447539fae818dfb2e692b')

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
