# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BioNERO
_pkgver=1.10.2
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
md5sums=('457b7a4c22d089631e931b46f0fe3973')
b2sums=('aaacf75de78dd9278dd960a9375d7400a15c9d14c015e3fd1ab7946a79e039e4812969e788267c2c27d33055e5336b91098b5277ba48284b5d4b2a416a1c9819')

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
