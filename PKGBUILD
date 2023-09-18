# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=margins
_pkgver=0.3.26
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Marginal Effects for Model Objects"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(MIT)
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
md5sums=('089978cd9b7fd9b0ba75525c9efe4641')
sha256sums=('098c9dd136005c5e27808bf42102d47d141d4e18ca3a3a17fa3287ff97eca56b')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
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
