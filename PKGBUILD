# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RNAdecay
_pkgver=1.28.0
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
md5sums=('32dac9e11506b95b403a79b02107145f')
b2sums=('7f64f57ed29a2e8880fb73b962d400c6dc382f9219bf996f040d13742d8178604d712528320edf3ebd30cdc1e0e26870ea8e261a50aec7f66392a956508c5f89')

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
