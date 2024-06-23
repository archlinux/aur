# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=canvasXpress
_pkgver=1.50.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Visualization Package for CanvasXpress in R"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-htmltools
  r-htmlwidgets
  r-httr
  r-jsonlite
)
checkdepends=(
  r-canvasxpress.data
  r-dplyr
  r-ggplot2
  r-readr
  r-shiny
  r-stringr
  r-testthat
)
optdepends=(
  r-canvasxpress.data
  r-dplyr
  r-dt
  r-ggplot2
  r-glue
  r-knitr
  r-limma
  r-png
  r-readr
  r-rlang
  r-rmarkdown
  r-shiny
  r-stringr
  r-testthat
  r-tibble
  r-tidyr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('63f11ad0c72cefacd72928c6378b9e7f')
b2sums=('ef5768059f83f428c3a8f74af08671c96d6013826035bb0f98102adbecd8dd6c40d0c0aa3a83f8367bb9cc3316daa23929d991fbb24d765be9791d183234efa8')

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
