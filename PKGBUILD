# Maintainer: Carson Buttars <carsonbuttars13@gmail.com>

_pkgname=padr
_pkgver=0.6.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=5
pkgdesc="Quickly Get Datetime Data Ready for Analysis"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-rcpp
  r-dplyr
  r-lubridate
  r-rlang
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-data.table
  r-ggplot
  r-knitr
  r-lazyeval
  r-rmarkdown
  r-testthat
  r-tidyr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1f89f33c6dbad215af0e7c8945ebae23')
b2sums=('d5edf02a67ccb607f5c42209d2de151e9fecb7be3cc02995709f86621590a31a57fece826b052db0e02285fee47ad68b5c53605b05e10114332af8407788bd88')

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
