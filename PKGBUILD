# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=toastui
_pkgver=0.3.4
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
md5sums=('c4f6efd66ef18e92c32de93ca91e12df')
b2sums=('041da6c35c81fdc28576af5dde02e6ca19207d09490f68a8b2aded846e4f099f36479ea65e836cefda0ce1c038ee73c9fc7ca6444f000d7af11cf520547d79c0')

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
