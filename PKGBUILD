# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=standR
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('94e29a2001fbb9d0bfa1488ae7039aa7')
b2sums=('0f74f667be28b33358bd40333b78e52f64f804e937d06843a52918760381db1c4ba86180f03289fcab4166229472c5abb655aefe9a260eb761d5f2e88a4dc0ee')

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
