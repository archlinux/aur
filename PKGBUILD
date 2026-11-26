# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=scrapper
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Bindings to C++ Libraries for Single-Cell Analysis"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  blas
  lapack
  r-beachmat
  r-biocneighbors
  r-delayedarray
  r-rcpp
  r-s4vectors
  r-sparsearray
)
makedepends=(
  r-assorthead
  r-rigraphlib
)
optdepends=(
  r-biocstyle
  r-igraph
  r-iranges
  r-knitr
  r-org.mm.eg.db
  r-rmarkdown
  r-scrnaseq
  r-singlecellexperiment
  r-summarizedexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b0c6a59e15fe68496c9e46361b25e29b')
b2sums=('000ca7540da20581767487e3cf64b3ff74319565f78e88acf93e48f4c6af7078795f55dd6c2645e6229f06cb50872c324449d8447f082d3b28539fb8fb5fce4d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
