# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=TEKRABber
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An R package estimates the correlations of orthologs and transposable elements between two species"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-3.0-or-later')
depends=(
  r-apeglm
  r-biomart
  r-deseq2
  r-doparallel
  r-dplyr
  r-foreach
  r-genomeinfodb
  r-magrittr
  r-rcpp
  r-rtracklayer
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
md5sums=('faa75e3ce575639b32b6a1f0ebd0b21d')
b2sums=('6b03222b5426fe6a729aa6ca179028e6bd0b121531a9c18c8417740250eb6d8e43b496add01fa6ee0ac66a2b0bea55d5413f44c1d3eec718be5d1998c72c488a')

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
