# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gsignal
_pkgver=0.3-5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Signal Processing"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-pracma
  r-rcpp
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-covr
  r-ggplot2
  r-gridextra
  r-imager
  r-knitr
  r-microbenchmark
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('75ee9ce9ea4efaba70efe3966d6b950d')
b2sums=('302dd2c399c6fa428edba0afef664adbe322cf517f21df28e8e8c92623724ecd86b63dd098e764c233feb4efe4f67988e76e15a0c5964b48cbbbcf53015f8c7b')

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
