# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=decontX
_pkgver=1.2.0
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
md5sums=('3d4a6f83a54c9f4cad51d594335a63ae')
b2sums=('b990dd26e924d7979e2215bb1982165534e1e060b2aa550043cf481de40452bb064953cfab5ee2d2ae1db4e3d16687def13b34ef60e94faf83243734b41bb1a2')

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
