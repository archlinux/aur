# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=DifferentialRegulation
_pkgver=2.2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Differentially regulated genes from scRNA-seq data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  blas
  lapack
  r-bandits
  r-data.table
  r-doparallel
  r-dorng
  r-foreach
  r-ggplot2
  r-gridextra
  r-rcpp
  r-singlecellexperiment
  r-summarizedexperiment
  r-tximport
)
makedepends=(
  r-rcpparmadillo
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f4f9bfaf9036c63441e52ba0fe55e1c5')
b2sums=('d1f5006bd2aa4202f33b5258db2d098a989ceb300859ff0d0dea43cfc5ab760249803a14b15bba4b58a71862b362a3b22428ae9eefa502f53275b11b4da329d1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testhat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
