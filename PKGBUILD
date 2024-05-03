# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BioNERO
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Biological Network Reconstruction Omnibus"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
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
md5sums=('3f6c538dcff7b95de07d4fd93ca29871')
b2sums=('947f7a140f30c8dc9905a501973656e4011e0e3a6a75904dfbe65332b36ed99b972f853f4a1ff0bb243bd73712b84daece18de1b1de725be3391e0f7b8015f6f')

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
