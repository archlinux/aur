# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CancerInSilico
_pkgver=2.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="An R interface for computational modeling of tumor progression"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-rcpp
)
makedepends=(
  r-bh
)
optdepends=(
  r-biocstyle
  r-gplots
  r-knitr
  r-rgl
  r-rmarkdown
  r-rtsne
  r-testthat
  r-viridis
)
source=("https://bioconductor.org/packages/3.16/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('716dc250caa885da7b8b0783f0871e16')
b2sums=('b31faa8a63654a7c91dd93a0b24a835981e411580e0f1e365c27534eba580ef5f1fcec4ca2ad656213fb75c1741c0828a36a1a26cddfdefa79fd6e6f1a5cba99')

prepare() {
  # replace SIGSTKSZ with a constant number
  sed -i "s,SIGSTKSZ,8192,g" "$_pkgname/src/Tests/catch.h"
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
