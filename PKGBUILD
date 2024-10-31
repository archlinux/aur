# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=epistasisGA
_pkgver=1.8.0
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
md5sums=('becb50c407ab48cee495562d867da943')
b2sums=('c6334267658f0f93e1926d83bc8842a7f8f97ae8c4b801e2dd3788b55f487355bd2f40689f54d6df7b0e6823cabbb1de52e674bf1aecf42ed387a96212bd2c73')

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
