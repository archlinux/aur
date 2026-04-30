# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=TSAR
_pkgver=1.10.0
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
md5sums=('49af56e2924022c9a42fd09bc3854de0')
b2sums=('31ca85a9f3ea715fcea224c9a0dd10d2e1b92bd257e344e6b5a879be6b3f4a696a531577f55c7ef591a0a8484190d05ff2ef6401dda02c6024191b391a8c5fb4')

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
