# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CHETAH
_pkgver=1.22.0
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
md5sums=('963cda83ff567a407a28b5106b955d8d')
b2sums=('f21366aa530bdbed8818f484e8f0c535b3df15a06f0eefe48e309991981e809871c933bae25d98ec3d6e06f33e613e942a44cdd819ee0beb496195c5e3c85550')

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
