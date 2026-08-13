# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=standR
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Spatial transcriptome analyses of Nanostring's DSP data in R"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-biobase
  r-biocgenerics
  r-dplyr
  r-edger
  r-ggalluvial
  r-ggplot2
  r-limma
  r-mclustcomp
  r-patchwork
  r-readr
  r-rlang
  r-ruv
  r-ruvseq
  r-s4vectors
  r-singlecellexperiment
  r-spatialexperiment
  r-summarizedexperiment
  r-tibble
  r-tidyr
)
checkdepends=(
  r-experimenthub
  r-ggpubr
  r-ggrepel
  r-scater
  r-testthat
)
optdepends=(
  r-experimenthub
  r-ggpubr
  r-ggrepel
  r-knitr
  r-rmarkdown
  r-scater
  r-testthat
  r-uwot
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d46a413020179be1295adc6798b0a38d')
b2sums=('177278e5b6cc38110745ace488b7434c4996151cf5a99ec12c3a3203d540b0de2cc5a8e516caef89bb14beaace233485b09c4289d146b8e70071066d9657d509')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
