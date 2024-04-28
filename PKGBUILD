# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RESOLVE
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
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
md5sums=('3dd3a656ed19f5faa759f4b37c459f53')
b2sums=('35b9d2fd9cdf9b66ad9566ccee9b45cc64ec3d1d9ec30a870adddc15ccb935cf53f64f192a66b1fc0219e814f662ae3577e7757850fead2c07eed1c0f00395c9')

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
