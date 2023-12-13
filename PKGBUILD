# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=TEKRABber
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An R package estimates the correlations of orthologs and transposable elements between two species"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(LGPL3)
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
sha256sums=('7495840995103b2303fb7d0f12440aa43e5d6d2e6e72e8fb9983c9f3da891950')

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
