# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CNEr
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="CNE Detection and Visualization"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only AND LicenseRef-CNEr')
depends=(
  r-annotate
  r-biocgenerics
  r-biostrings
  r-dbi
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-ggplot2
  r-go.db
  r-iranges
  r-keggrest
  r-powerlaw
  r-pwalign
  r-r.utils
  r-readr
  r-reshape2
  r-rsqlite
  r-rtracklayer
  r-s4vectors
  r-xvector
)
optdepends=(
  r-biocstyle
  r-bsgenome.drerio.ucsc.danrer10
  r-bsgenome.ggallus.ucsc.galgal3
  r-bsgenome.hsapiens.ucsc.hg19
  r-bsgenome.hsapiens.ucsc.hg38
  r-gviz
  r-knitr
  r-rmarkdown
  r-testthat
  r-txdb.drerio.ucsc.danrer10.refgene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9eeb740891291deab2ec013e894d6cdc')
b2sums=('a0f116edefca65479d1ba8a13e47ba46f885570631a29edada25e22b42e614b220b1801564be399bbc32bed057964796ce985cae406f2e87dedf7383e1f4500b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
