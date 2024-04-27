# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=TEKRABber
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="An R package estimates the correlations of orthologs and transposable elements between two species"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-3.0-or-later')
depends=(
  r-apeglm
  r-biomart
  r-deseq2
  r-dplyr
  r-magrittr
  r-rcpp
  r-scbn
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-bslib
  r-ggplot2
  r-ggpubr
  r-knitr
  r-plotly
  r-rmarkdown
  r-shiny
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('145026d8a5e02ec94f8a2a1f5405851e')
b2sums=('9430f5120445d15b91b553d263d106ddfe2ced847678fca35d3853e113901df50fda6d6431ccf1fae1ba0dd3ce982f272a324af7ece0a95b2723bd852158a759')

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
