# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RESOLVE
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="RESOLVE: An R package for the efficient analysis of mutational signatures from cancer genomes"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Apache)
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
sha256sums=('3fe1a6d0171af5d2ecd111a4bdb690e466081a16d930587eedacba7fb16af3d7')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
