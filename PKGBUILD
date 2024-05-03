# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RESOLVE
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An R package for the efficient analysis of mutational signatures from cancer genomes"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Apache-2.0')
depends=(
  r-biostrings
  r-bsgenome
  r-bsgenome.hsapiens.1000genomes.hs37d5
  r-data.table
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-glmnet
  r-gridextra
  r-iranges
  r-lsa
  r-mutationalpatterns
  r-nnls
  r-reshape2
  r-s4vectors
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('202f10a19b1ca124f5c29d64e69ae269')
b2sums=('b7f1e1ba107ccdb1c8b43c5540cab2ca6c25b27828e00b99169f985fb4f78fb198b43cc94433276bb0ba8f35075f1736611d4d7cf150e97739eaf98684f64897')

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
