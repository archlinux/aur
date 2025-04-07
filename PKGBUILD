# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=toastui
_pkgver=0.4.0
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
md5sums=('85097a28ee748855055d7275a62f3bde')
b2sums=('44a7a9a14236275d4dbcdcaf1496f8af0ec8bdd43e2d964baa0d4d119acda885c6b06ea1470b7af10969a212e8cd37cb1c4c823b3ab75f90c96c3dda4e3dc71a')

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
