# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=TEKRABber
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An R package estimates the correlations of orthologs and transposable elements between two species"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-3.0-or-later')
depends=(
  r-annotationhub
  r-apeglm
  r-biomart
  r-deseq2
  r-doparallel
  r-dplyr
  r-foreach
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
  r-genomeinfodb
  r-ggplot2
  r-ggpubr
  r-knitr
  r-plotly
  r-rmarkdown
  r-shiny
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('dcc763baf14dbe4097c0c3d594796742')
b2sums=('16546098c9f66eafea28fdc8cdda1e41f31dd65e261c90b9bc4030ba665ab6cb09b8781963bdab3c5616e06d79fb13a30b50fba616e0c2f12ba5c5d64b2ecb1e')

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
