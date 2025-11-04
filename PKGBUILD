# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=TSAR
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Thermal Shift Analysis in R"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('AGPL-3.0-only')
depends=(
  r-dplyr
  r-ggplot2
  r-ggpubr
  r-jsonlite
  r-magrittr
  r-minpack.lm
  r-openxlsx
  r-plotly
  r-readxl
  r-rhandsontable
  r-shiny
  r-shinyjs
  r-shinywidgets
  r-stringr
  r-tidyr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('cd25a686bcaef3a95327f10e98be7893')
b2sums=('cb9271eb564485e829b55a7dfa128ffbda06bd2abcac18b70eff6ec99d91499d04574282a1586e41dbda3d68a7d79ac36956c053ddf5ddfda3183f19a2963f13')

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
