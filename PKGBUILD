# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=decontX
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Decontamination of single cell genomics data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  onetbb
  r-celda
  r-dbscan
  r-delayedarray
  r-ggplot2
  r-mcmcprecision
  r-patchwork
  r-plyr
  r-rcpp
  r-rcppparallel
  r-reshape2
  r-rstan
  r-rstantools
  r-s4vectors
  r-scater
  r-seurat
  r-singlecellexperiment
  r-summarizedexperiment
  r-withr
)
makedepends=(
  r-bh
  r-rcppeigen
  r-stanheaders
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-dplyr
  r-knitr
  r-rmarkdown
  r-scran
  r-singlecellmultimodal
  r-tenxpbmcdata
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1e2f4af9204397b8104543dd954bb390')
b2sums=('f6083f5678fbaeb0676893f1a70d33946392b67d88902cb59202d083f5dd137d43e09f7dec92f8df3353c968283e018791a7c4075e2cf7f12c497425824fc152')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
