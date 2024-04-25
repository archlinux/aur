# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=TSAR
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('7cc8589151c5b03e247590bbd7dc04dd')
b2sums=('d9205a69412876f57d55f9f9d30d6133eb296b132b104bcdf2622e9c57018c063c5ba09b3d545444021a19c8650bffc86464595e888dd148a7f8bfa3c6b92e8d')

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
