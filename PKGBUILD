# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=benchdamic
_pkgver=1.6.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Benchmark of differential abundance methods on microbiome data"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
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
md5sums=('21359de3f80f3bfe1501ac5d6ec4d050')
sha256sums=('12ceef0118f89993bb5ae0ab430de78b7f2bdcfe8d0a78000bab4b137c876251')

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
