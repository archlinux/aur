# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CNEr
_pkgver=1.40.0
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
md5sums=('be665143e17bc80ce2e839d4d05bed4b')
b2sums=('db9d2154eb34269854c55dca1fa8eccb6aab828203b2c657f743f4f35d03619c9b1fb955345c13b88f4b5092ffb09561703da117ac2ea3a5f00e9616b05a1771')

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
