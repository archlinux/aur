# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RNAmodR
_pkgver=1.18.0
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
md5sums=('b7fedb35353258c8ab2c8915f0367283')
b2sums=('8fbf460349f3c6cd9c7e46e75c4564065654897742fbee3530c967ef356961064bb2aa468adbc4c2b86df515cab1ad298a679564ea35ddfaec10ddac22c35a00')

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
