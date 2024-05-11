# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DepecheR
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Determination of essential phenotypic elements of clusters in high-dimensional entities"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-beanplot
  r-clusterr
  r-collapse
  r-dosnow
  r-dplyr
  r-fnn
  r-foreach
  r-ggplot2
  r-gmodels
  r-gplots
  r-matrixstats
  r-mixomics
  r-moments
  r-rcpp
  r-reshape2
  r-robustbase
  r-viridis
)
makedepends=(
  r-rcppeigen
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
  r-uwot
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5195d544797a0a5fc0eb9c0d712b9e68')
b2sums=('aaa5c2ff15307613d25e925b6f3ae8d4d7c23954d84e93c3b7b41ff0b6b3ab67644a2c7a1da17599d54f679cd97190db2f63d267b7a2a9a360572ff748c22564')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
