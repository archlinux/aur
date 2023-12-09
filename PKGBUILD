# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=extraChIPs
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Additional functions for working with ChIP-Seq data"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
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
md5sums=('462672c12f16f912b7e3d4b30a07162f')
sha256sums=('92031cff96880e0e7c1cfa46084ec580991c01a7e23c0734f1802778a1e0c47e')

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
