# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BioNERO
_pkgver=1.10.1
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
md5sums=('cf8a0a4d5229ba0ff8060188e110f8f9')
b2sums=('cc897a6b4c49ddd75ae083a83c3beb15ca18a78018e137cbecec3ab0e534dcdbd2fa211cf496f818ad337f4fc203360820c4e22f51220b5c8bd04373852632c1')

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
