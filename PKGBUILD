# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RNAmodR
_pkgver=1.20.0
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
  r-genomeinfodb
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
md5sums=('391d754edd4e3269fd8d604883b37b14')
b2sums=('1960a8898097d2942616e990468f0c7b17aa59a158e04b86944dde6439344c41326185a8d011db3e2087e805156c3a39c1308a4f0bf0e6279a4a28334a001c45')

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
