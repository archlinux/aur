# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RNAdecay
_pkgver=1.30.0
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
md5sums=('f8ffa1eec0ec558b6eb6df18048e2428')
b2sums=('73e4a27fb284727926a0bd994732af68b4ccddd79254e7e84bac3ad30d46fa3d53b850909a25bda1675a73db5d2617dcaf8fd300722053a4ea75bbf9859faff0')

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
