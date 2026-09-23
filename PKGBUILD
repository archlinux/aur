# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=billboarder
_pkgver=0.5.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Create Interactive Chart with the JavaScript 'Billboard' Library"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-ggplot2
  r-htmltools
  r-htmlwidgets
  r-jsonlite
  r-magrittr
  r-rlang
  r-scales
  r-shiny
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-covr
  r-knitr
  r-rcolorbrewer
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('363d5db9d8cafcea349ce2df704bfce5')
b2sums=('6beb761c6c66faa2b0f87d19211c294a56425d270aeceb1f3c79bc24e75520d2a3ba960b0b7b3428dbf701e10ab91cc5128576a48190cccfd08726d28d8e7c81')

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
