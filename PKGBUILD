# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scoringRules
_pkgver=1.1.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="Scoring Rules for Parametric and Simulated Distribution Forecasts"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  blas
  lapack
  r-knitr
  r-rcpp
)
makedepends=(
  r-rcpparmadillo
)
checkdepends=(
  r-gsl
  r-hypergeo
  r-testthat
)
optdepends=(
  r-crch
  r-ggplot2
  r-gsl
  r-hypergeo
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('be9a9c10613e5ff981b72b32b8da30d9')
b2sums=('b087771cf7c26e0623fdf40f60288daf020e284898a5ed45663f2933248ce9708f929e936f74127fd97d85a56466103008c231f21e137234aec8de9a9dd3cde8')

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
