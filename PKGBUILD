# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=benchdamic
_pkgver=1.8.2
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
md5sums=('3e181e9df4a701c33b61a184a26f0a59')
b2sums=('1588d6de023a6f80582bdffc8de610b0830ac1a0120e4ed3018b585082a55018b3f4b17df7cd02289033ea30f565dc085a6445fb8b6d78daf314f8c03488f309')

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
