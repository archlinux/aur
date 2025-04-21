# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BioNERO
_pkgver=1.16.0
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
md5sums=('5efbcf10d500e2aceb0e91830b5aef4c')
b2sums=('5fe9b0cf79a9cf58cb9d5375241da08286db9dd21ce832c5daff386df17d7e8106fcf03026d2fdfebec9d165153c8abd704dd1e895317dc9b5acc15c8b3d76a8')

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
