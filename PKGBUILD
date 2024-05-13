# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RNAdecay
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Maximum Likelihood Decay Modeling of RNA Degradation Data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-ggplot2
  r-gplots
  r-nloptr
  r-scales
  r-tmb
)
makedepends=(
  r-rcppeigen
)
optdepends=(
  r-knitr
  r-reshape2
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4b013eb50cd972559df41fb6361bf1bc')
b2sums=('5481d2048fdab3c21ebf0aceacdfe0cd9ffdcfb89c2ae5b82c72028a6cd477725ba78c73a32bea94a49e2d0f47111886072c0ccdfeed517434e212ad409281f8')

build() {
  mkdir build
  # compilation needs a lot of memory
  MAKEFLAGS+=" -j1"
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
