# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scoringRules
_pkgver=1.1.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Scoring Rules for Parametric and Simulated Distribution Forecasts"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
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
sha256sums=('393ff96e17e70c31ede7c30fff36cea2d1f7863be2339b523ab2960c6510c5e3')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
