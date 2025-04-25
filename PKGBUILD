# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AneuFinder
_pkgver=1.35.0
pkgname=r-${_pkgname,,}
pkgver=1.35.0
pkgrel=1
pkgdesc='Analysis of Copy Number Variation in Single-Cell-Sequencing Data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-aneufinderdata
  r-bamsignals
  r-biocgenerics
  r-biostrings
  r-cowplot
  r-dnacopy
  r-doparallel
  r-ecp
  r-foreach
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-ggdendro
  r-ggplot2
  r-ggrepel
  r-iranges
  r-mclust
  r-reshape2
  r-rsamtools
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-bsgenome.hsapiens.ucsc.hg19
  r-bsgenome.mmusculus.ucsc.mm10
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f442854b5aa4ca9179c543caf7cf35441eabd2b405a648fb693145cf765ea07f')

prepare() {
  sed -i $_pkgname/src/*.cpp \
    -e 's|Calloc(|R_&|g' \
    -e 's|Realloc(|R_&|g' \
    -e 's|Free(|R_&|g'
}
build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
