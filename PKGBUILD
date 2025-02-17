# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=R6P
_pkgver=0.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Design Patterns in R"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-collections
  r-dplyr
  r-r6
  r-stringr
  r-tibble
  r-tidyr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-dbi
  r-ggplot2
  r-rsqlite
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('efb540354319f453fa76705f9b315580')
b2sums=('d9e22176f107318d8f3c49bf33723d3dc5204433e26d4d340b029083e0630ee506add2f786a61ee0ab5012b0349660fe234b78a72d3d990d82dbc7fcc2aefcc3')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
