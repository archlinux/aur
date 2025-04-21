# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=shinymeta
_pkgver=0.2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('e037bae6ddfd43052402e2fc50a2faf4')
b2sums=('d2448f521d3301da5248758921ef4bde75e1459b073e3498ebeb673a3c73702ed8431574070723c10f026a8988ed9f17d9ae5944f4d311a6c2b3c3dbe3625fbe')

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
