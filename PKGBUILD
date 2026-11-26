# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RNAdecay
_pkgver=1.34.0
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
md5sums=('48db048b3f433244bb5c7ce5cbf63911')
b2sums=('f3f506a21431227044c772d38404878f0f0817754dcf4af01e80e9158941d1c2a6f3eb97c7a5073f668c73ba4b92c005b056588a8f2e4e42728b281b73f8df75')

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
