# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CNEr
_pkgver=1.48.0
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
  r-seqinfo
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
md5sums=('2d1b5e22415790430a213ccaea172277')
b2sums=('96b6247fb3ca75b9d4ac98990cb818ad3443b59345931335206dbf87509810d99de69241921ef38295292e1ccef2449fb87370a43cf6cb4b5fb12da8212bf3d0')

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
