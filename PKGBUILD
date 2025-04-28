# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DepecheR
_pkgver=1.24.0
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
md5sums=('6ae72fc09a92582398ced8b7d01b7be1')
b2sums=('9902db0ec742e771d82147827b89a4bbdb7d6c8f92c917bab9994d96c89ec570251200255608e3826fca75d767bc54405017c2a733e8a06c9f4eb85beb2b7c4d')

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
