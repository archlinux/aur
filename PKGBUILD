# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=hdf5r
_pkgver=1.3.10
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
md5sums=('6bd2d45695b64a082a88324a901b571c')
b2sums=('f299fcd4d148f4082c8eefec8f9f47bc3e97127ddfaefa3af22aea54f48d374431e8cf1f428b6a5d2d4c8cb68375a50feadb9a0c82766235382cac9bb9a55478')

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
