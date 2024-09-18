# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scoringRules
_pkgver=1.1.3
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
md5sums=('19929b071886f210a0436d7a415c0cd9')
b2sums=('2c1f0f97924c5be0421ffd070bf487f59ce6ff1432e57babddd217565a010a4e570b58857936d506303f6e272e4f7d4405a94aaca26a23031299a025b6f0f900')

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
