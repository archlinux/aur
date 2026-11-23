# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RESOLVE
_pkgver=1.14.0
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
  r-rhpcblasctl
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
md5sums=('94db984b213da0a668ef1acc5b9c9dfb')
b2sums=('755140fbf2edbeecc6bbd9a8ea9873d3e380aebf42c478b9da31876396557d838bad019ef4c6443ecbd2b646daff3d5a69484efe791600fa875ff6d0b0fb50fe')

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
