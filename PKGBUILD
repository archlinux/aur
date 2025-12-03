# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DepecheR
_pkgver=1.26.0
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
md5sums=('e1e17b2d8970d895974a6f034a3c8de4')
b2sums=('4d20e0f1af21110fc41936e7616c5beaa58748e9f3a9a953badc19d5eea50edc053ddf961663be16d1552ab706a289d9dfdc09685a52d74cc233045af935024b')

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
