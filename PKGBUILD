# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=benchdamic
_pkgver=1.10.0
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
md5sums=('c3428b91ddfe47669965693fb87d6928')
b2sums=('9ff094e3fda2210d544bca6788a86be2d06882243b7a7421fc17b7250f8fd271ccfc7a764b591324dd82ba5bf554b1090108bf7cf85622f7055418c333e3114d')

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
