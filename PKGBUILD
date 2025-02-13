# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=hdf5r
_pkgver=1.3.12
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
md5sums=('91c748c7072b47709a368d32a93dc469')
b2sums=('65a30b01d6c29103cbdf68973a01bdcf4e7f1bcc45bf5659257d1b3c1033f1ff2ba6e64edb965e451f60b8e7e5cea9a3ae2eab41c500d9d573fb583b1467d07f')

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
