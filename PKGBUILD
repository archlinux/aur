# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RNAdecay
_pkgver=1.26.0
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
md5sums=('234bd79f217035934dc16605bca37397')
b2sums=('abf2652aaa88c1605c424d7a3dca909a04f1858e7ede980ab47478701edb8e2feb75c53e8426269e2c400aa60fd92f0c77449d13e0739d363360db652151cddf')

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
