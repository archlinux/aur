# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ivreg
_pkgver=0.6-3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Instrumental-Variables Regression by '2SLS', '2SM', or '2SMM', with Diagnostics"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
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
  r-gt
  r-insight
  r-knitr
  r-modelsummary
  r-rmarkdown
  r-sandwich
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1c075bf0aaad86617337083bb36599dd')
b2sums=('0489e65a7bd72913280678719ca482a7f4cffed36e244e79bf8220e1b573d5dc8cf93e1be6a4f83e975c6b2e23ad364c458a0f79e027721da4e30325ea6cfb15')

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
