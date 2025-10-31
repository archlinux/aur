# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SharedObject
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Sharing R objects across multiple R processes without memory duplication"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocgenerics
  r-rcpp
)
makedepends=(
  r-bh
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('725707e5bf6c3d4d10911da3103c3318')
b2sums=('6ce046078c85268487dd00301fae902e0dd92dcab1aeb8945bae49cc5e75066c1aec7a78a7a2a104fe69deafc9fa5acfae59c9ad636339bba630702902f866a6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
