# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=DifferentialRegulation
_pkgver=2.10.0
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
md5sums=('9523894fd3e779fb0edf3e689a2352d9')
b2sums=('69c2d3385964423876166362c675be55dd3fe8035822b78aff010f471f00a3756253075c0fe8264c85ecd108ce12361b4a564bc4fcd284af392102d8d78e593f')

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
