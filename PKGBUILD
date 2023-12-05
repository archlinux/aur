# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=canvasXpress
_pkgver=1.46.9-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Visualization Package for CanvasXpress in R"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL3)
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
md5sums=('f25e77795fcb5dc87488793b343c60e0')
sha256sums=('a6e382b05f6d4f7c29c3a1bfc1a49b30c69f404f7c2ff5652122b5dfef63667d')

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
