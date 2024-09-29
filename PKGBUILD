# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=benchdamic
_pkgver=1.10.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Benchmark of differential abundance methods on microbiome data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-aldex2
  r-ancombc
  r-biocparallel
  r-corncob
  r-cowplot
  r-dearseq
  r-deseq2
  r-edger
  r-ggdendro
  r-ggplot2
  r-ggridges
  r-gunifrac
  r-limma
  r-lme4
  r-maaslin2
  r-mast
  r-metagenomeseq
  r-mglm
  r-microbiomestat
  r-mixomics
  r-noiseq
  r-phyloseq
  r-plyr
  r-rcolorbrewer
  r-reshape2
  r-seurat
  r-summarizedexperiment
  r-tidytext
  r-treesummarizedexperiment
  r-zinbwave
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-kableextra
  r-knitr
  r-magick
  r-rmarkdown
  r-spsimseq
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('da159f53d1021bd6dc0e48daa53e40b0')
b2sums=('95ee6b07483ebde2d27d2a43cb63c270693275e994a7f76dc700e6881fb0767f33ecdf357afc5cd963631e933208115027723d8297d6e709bd8f21109f720da5')

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
