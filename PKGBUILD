# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=standR
_pkgver=1.8.0
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
md5sums=('d7ab5f450cb205800a4b7fc2eae225e9')
b2sums=('0f256e4bd1269d5286a4b0eba92fe4ca949f3b6380d97940587ff3dd40ae97f1fa81caa9b6db02b01a600bdee9bfe42403197251523c587ad8390758c3189394')

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
