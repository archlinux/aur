# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=epistasisGA
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An R package to identify multi-snp effects in nuclear family studies using the GADGETS method"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  blas
  lapack
  r-batchtools
  r-bigmemory
  r-biocparallel
  r-data.table
  r-ggplot2
  r-igraph
  r-matrixstats
  r-qgraph
)
makedepends=(
  r-bh
  r-rcpp
  r-rcpparmadillo
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-kableextra
  r-knitr
  r-magrittr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('09de4e62bcd99b24f0b9abdf302ca0fe')
b2sums=('f81781bc023eda31d201b60693faf5a0ab0ab4eb8b529ea25795a0de6e6bad67a2d1580cbd5aa770673e73b087dfbdef1a5f643ea8a70e233dac3f6455bb794f')

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
