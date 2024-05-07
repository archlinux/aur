# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=extraChIPs
_pkgver=1.8.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Additional functions for working with ChIP-Seq data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocio
  r-biocparallel
  r-broom
  r-complexupset
  r-csaw
  r-dplyr
  r-edger
  r-forcats
  r-genomeinfodb
  r-genomicinteractions
  r-genomicranges
  r-ggforce
  r-ggplot2
  r-ggrepel
  r-ggside
  r-glue
  r-interactionset
  r-iranges
  r-matrixstats
  r-patchwork
  r-rcolorbrewer
  r-rlang
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-scales
  r-stringr
  r-summarizedexperiment
  r-tibble
  r-tidyr
  r-tidyselect
  r-vctrs
  r-venndiagram
)
checkdepends=(
  r-deseq2
  r-enrichedheatmap
  r-harmonicmeanp
  r-testthat
)
optdepends=(
  r-biocstyle
  r-covr
  r-cqn
  r-deseq2
  r-enrichedheatmap
  r-gviz
  r-harmonicmeanp
  r-here
  r-knitr
  r-limma
  r-magrittr
  r-plyranges
  r-quantro
  r-rmarkdown
  r-testthat
  r-tidyverse
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0afeb5903409d749f90b4e5a3aab9fad')
b2sums=('4fcd2558a82f28d88d6e79e513a5024c575cd58e90ca5258e35a8783ea815c800fc99ec68a420ad16067d2f1d7010576fc3151c8dc7622c9d1224e2c24d11b81')

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
