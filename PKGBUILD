# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ivreg
_pkgver=0.6-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Instrumental-Variables Regression by '2SLS', '2SM', or '2SMM', with Diagnostics"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
depends=(
  r-car
  r-formula
  r-lmtest
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-aer
  r-effects
  r-ggplot2
  r-insight
  r-knitr
  r-modelsummary
  r-rmarkdown
  r-sandwich
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9221729c0eb7b31dd7dd6bc8f373931d')
sha256sums=('b4a7fa876efedf951e9ace1ef3d6d997481dc4d806226ef7f230acfa33923896')

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
