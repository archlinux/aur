# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=iNEXT
_pkgver=3.0.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interpolation and Extrapolation for Species Diversity"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-ggplot2
  r-rcpp
  r-reshape2
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-ggthemes
  r-gridextra
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8de69efe440d8933e1c843103c2a0ef3')
b2sums=('01a197ed9940a4f786161108af14c159ead165b136a0c38a5fca3639e0c1b59f9c68eafe79b47cf6d1595bb42eeefe11830dbad02bddb4a889bea306842f8f7a')

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
