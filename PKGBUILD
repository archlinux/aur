# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=shinymeta
_pkgver=0.2.0.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Export Domain Logic from Shiny using Meta-Programming"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL3)
depends=(
  r-callr
  r-fastmap
  r-fs
  r-htmltools
  r-rlang
  r-shiny
  r-sourcetools
  r-styler
)
checkdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
optdepends=(
  r-clipr
  r-cranlogs
  r-dplyr
  r-ggplot2
  r-knitr
  r-magrittr
  r-rmarkdown
  r-shinyace
  r-stringr
  r-testthat
  r-xfun
  r-zoo
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5452325a791296ba7fb6725d937f9fb0')
sha256sums=('095dffe6d8763edf42eabf91f606aad12f3a08271fcd9d7257c2812775793fd2')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
