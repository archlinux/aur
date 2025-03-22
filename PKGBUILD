# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=decontX
_pkgver=1.4.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('dec488033f306592ef98199639abf1c8')
b2sums=('698eac5f3938d5557889e0f9bb355a4ecbea54d067d954b0c585ed5ea4293888cf2394026ef6cf976189532cbdc8580c1ecc2ec68619089da56382df8d3c1aa9')

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
