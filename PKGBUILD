# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=logitnorm
_pkgver=0.8.39
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Functions for the Logitnormal Distribution"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-ggplot2
  r-knitr
  r-markdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1d08b2f259ce83e21ab7542212518eb9')
b2sums=('e6cea7549d18d26b0afeaa0cf6e3bc23ac8bf515e73aca03e41f2bc4e79f128f591e13855c223edb48340eb65b5bac15c344c516ac8564721fb18a103ce5022e')

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
