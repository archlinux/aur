# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=hdf5r
_pkgver=1.3.16
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
md5sums=('f1d281882e87137f59a815c401d8d0d7')
b2sums=('514a1684413426ba08c688bc439c0051b66567e8600ac7b7bd1e1b7c93bfb0a9a47f8421784339ebc2a0fda4023b310aff952a3e1296f89fd86815a3731c1565')

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
