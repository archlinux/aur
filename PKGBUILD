# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=toastui
_pkgver=0.3.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interactive Tables, Calendars and Charts for the Web"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-htmltools
  r-htmlwidgets
  r-magrittr
  r-phosphoricons
  r-rlang
  r-shiny
  r-shinywidgets
)
checkdepends=(
  r-tinytest
)
optdepends=(
  r-apexcharter
  r-bslib
  r-knitr
  r-rmarkdown
  r-scales
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ff076c3c90f56a3ff70bb6303dd650e8')
b2sums=('2abaf6716a4f674d59a7a5de6d3e10e208290e0f8fe5cfa139805c025cead1af770ae7f9fe14f73c4d499caf3aa1164fb715296216ef4752f695ff1d918a5f6d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla tinytest.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
