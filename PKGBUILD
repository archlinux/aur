# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=extraChIPs
_pkgver=1.6.1
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
  r-enrichedheatmap
  r-forcats
  r-genomeinfodb
  r-genomicinteractions
  r-genomicranges
  r-ggforce
  r-ggplot2
  r-ggrepel
  r-ggside
  r-glue
  r-gviz
  r-interactionset
  r-iranges
  r-limma
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
  r-harmonicmeanp
  r-testthat
)
optdepends=(
  r-biocstyle
  r-covr
  r-cqn
  r-harmonicmeanp
  r-here
  r-knitr
  r-magrittr
  r-plyranges
  r-quantro
  r-rmarkdown
  r-testthat
  r-tidyverse
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1dd6dd8771e0dfa2ba6d612e53456eda')
b2sums=('3acaec2c02ecb50d10d394dc7e129ea8830a5a66b5ab5d8244830e13c4b31ce43ecce13c97210a45c692d83decb10027a08024dc9cfd5c68cac47492313f2310')

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
