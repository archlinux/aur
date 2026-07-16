# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CHETAH
_pkgver=1.28.0
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
md5sums=('8cde64c32f4421e99442ec0d3ed5464f')
b2sums=('5e9e0aef308610847be9e7036d6281079139f7909effc272ea60271f99ee3480b873f7ec26d2d4aa752cb991ec6b6ca33701f867473e97ffdbbfdec26bf26b9a')

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
