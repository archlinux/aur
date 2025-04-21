# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CHETAH
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fast and accurate scRNA-seq cell type identification"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('AGPL-3.0-only')
depends=(
  r-biodist
  r-corrplot
  r-cowplot
  r-dendextend
  r-ggplot2
  r-pheatmap
  r-plotly
  r-reshape2
  r-s4vectors
  r-shiny
  r-singlecellexperiment
  r-summarizedexperiment
)
checkdepends=(
  r-testthat
  r-vdiffr
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
  r-vdiffr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0dbb8c959511f9dd1104d965bbbb0f6d')
b2sums=('a2de9b717d23f7141a146a6d03af77e107dadb0456c32afd881ab318f9c3de8864c36c0fa9a88312263333186ae160914b1d4aadd64310cedfb940a24a83db69')

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
