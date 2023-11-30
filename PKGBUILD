# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=epistasisGA
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An R package to identify multi-snp effects in nuclear family studies using the GADGETS method"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
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
md5sums=('79635d9683f002813e51fa3c17e49b39')
sha256sums=('214867cd3357037f6c094be7ef2dda4c7fb5653a84fd86b2c8354b06882ad836')

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
