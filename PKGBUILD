# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=shinymeta
_pkgver=0.2.0.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Export Domain Logic from Shiny using Meta-Programming"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
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
  r-stringr
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
b2sums=('47de2bc551ac73dae79ce8c297f1741216049f502f88ea3e1f1e170e8352f79bc36805947f7de533e09cc6bee4850ef7484b867193bdca02f7a781fdf98f8441')

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
