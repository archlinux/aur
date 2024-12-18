# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DepecheR
_pkgver=1.22.0
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
md5sums=('92e4d0d9bdaa1db09f4a2785693aa15e')
b2sums=('ac943162174920bf3f8b15c5eb130d43ec8fe67d63957c4a79afcacf71604454e39b7f40bdab07f08187cbd9a4e7ab405021a4d24ed9fd9d8a6a552af4da9b72')

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
