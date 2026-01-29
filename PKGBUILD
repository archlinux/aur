# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=billboarder
_pkgver=0.5.1
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
md5sums=('b92a5e07b83b55ba26c130288fd4769e')
b2sums=('f94d72c28bad4f1092aea1b6a9a30091f5a432fc6dbbf68a37626eaf7586c59fa92a3494393df275b0710f90a81cf8f7836144cf74839884ad646bd8dad50fe4')

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
