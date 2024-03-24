# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=margins
_pkgver=0.3.26.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Marginal Effects for Model Objects"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-data.table
  r-prediction
)
checkdepends=(
  r-aer
  r-betareg
  r-lme4
  r-ordinal
  r-survey
  r-testthat
)
optdepends=(
  r-gapminder
  r-ggplot2
  r-knitr
  r-lme4
  r-rmarkdown
  r-sandwich
  r-stargazer
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('dd589d282b4de60a78614e3d0cabac3b')
b2sums=('d2e66d91b7b4af64f54c36938788af7160ede1c324756d60c1d6b53cbcc86b1da598372c3d09cbac983ba739adc36c68585e7b3d481475c39615503fd9207516')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat-margins.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
