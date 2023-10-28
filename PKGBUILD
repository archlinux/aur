# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BioNERO
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Biological Network Reconstruction Omnibus"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
depends=(
  r-biocparallel
  r-complexheatmap
  r-dynamictreecut
  r-genie3
  r-ggdendro
  r-ggnetwork
  r-ggplot2
  r-ggrepel
  r-igraph
  r-intergraph
  r-matrixstats
  r-minet
  r-netrep
  r-patchwork
  r-rcolorbrewer
  r-reshape2
  r-rlang
  r-summarizedexperiment
  r-sva
  r-wgcna
)
checkdepends=(
  r-networkd3
  r-testthat
)
optdepends=(
  r-biocstyle
  r-covr
  r-deseq2
  r-knitr
  r-networkd3
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4cc77a8b8eb3cff071fbe5df15a6eb67')
sha256sums=('50b80750e69ce61cade88fce9b5f488fb39514b4cbdc3165a1a88bc55474055f')

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
