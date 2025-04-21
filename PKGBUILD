# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=TSAR
_pkgver=1.6.0
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
md5sums=('e75cb3a268074a0a0efe01986afb8844')
b2sums=('9c7fbef77e8f7a2703f62b64bc7dfb6552e76dd0f5d8d89e75e72c642af3c6c7c6a9c217142c339e09ddfa96f6e209f3d0f3b81fd2965c686a9abb7934334fd1')

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
