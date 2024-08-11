# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=extraChIPs
_pkgver=1.8.5
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
  r-apeglm
  r-deseq2
  r-enrichedheatmap
  r-harmonicmeanp
  r-testthat
)
optdepends=(
  r-apeglm
  r-biocstyle
  r-covr
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
md5sums=('d515730a24ba1c2498470f5640bf8a27')
b2sums=('f48b70df77b0ae1ecc3ffb6b6bb188f7bdcbc3f9dd4a88714b4bc63a7802fe470e74a546bc65140c4a2ceebd64550ae9b93b782e499e79c61568a32c6a5f6165')

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
