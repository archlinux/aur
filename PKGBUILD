# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=epistasisGA
_pkgver=1.6.0
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
md5sums=('c5d3006f0c36ed266bbd740651f435dc')
b2sums=('19c820b23ba592069040d55bcd75230a13996935fd949bd39b593ff699fb5a34bad8ca8d6aad86b23a5eb14b1b44e81cbac8567727a886e4c1d1aba8a655d466')

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
