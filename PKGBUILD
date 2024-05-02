# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=TSAR
_pkgver=1.2.0
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
md5sums=('8e206686dbb35ea9263932955484f4db')
b2sums=('7f1b307e939a38e86ee4b6c091fea42b996c84fea16769aa04a067695c62b9ba2ccd99d7952f454364e7f0e9679cf5f098a5efdba9fcce470fc752bc49f25fab')

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
