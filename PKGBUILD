# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scoringRules
_pkgver=1.1.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('76d4fb931969d263f3542907bcca51af')
b2sums=('8aa1f38da55f5529da65d1ff0d6409d8498c710f0fcc5285ab5fe4cb606960b5e9c65c0cc2efce55d578bc525c2810a12400cf175b89036c63155d756772e030')

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
