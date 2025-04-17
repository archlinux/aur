# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=epistasisGA
_pkgver=1.10.0
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
md5sums=('c9f3518ce1f9054100289a049a70699f')
b2sums=('b616dbfec3faae6faeddd135d75857ac425582f312215306294c5ae5469f09e9355fb4e21f6a59e87b803a526a1286f144ea5e5e929560f75a3b4b653e513d8e')

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
