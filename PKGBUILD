# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=DifferentialRegulation
_pkgver=2.12.0
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
md5sums=('471ca91c4f3359f48d32482280b41b1e')
b2sums=('e13dc79451d295901ddb2b6adb577d9daefaf2b1512088616b1d32bfc4d9d1e620a6f473a33771863b30774dc2166149ee8c23284f4d215e323030edb5b71ff6')

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
