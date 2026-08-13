# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RNAmodR
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Detection of post-transcriptional modifications in high throughput sequencing data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-bsgenome
  r-colorramps
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-gviz
  r-iranges
  r-matrixstats
  r-modstrings
  r-rcolorbrewer
  r-reshape2
  r-rocr
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-seqinfo
  r-txdbmaker
)
checkdepends=(
  r-rnamodr.data
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-rnamodr.data
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1f3259da0c2486bb808e4e8a618f6e33')
b2sums=('d403f708670a3cec716b6c8eea5e8011c0b2cfaff16bd728a42a4506338f3388ea2986476d890ad6b0a74260525acee733edbf45b676f293e768fcef93fefab6')

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
