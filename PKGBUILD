# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ReactomeGSA
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Client for the Reactome Analysis Service for comparative multi-omics gene set analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-biobase
  r-dplyr
  r-ggplot2
  r-gplots
  r-httr
  r-jsonlite
  r-progress
  r-rcolorbrewer
  r-tidyr
)
optdepends=(
  r-devtools
  r-knitr
  r-reactomegsa.data
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d26ef99a4e66f2bd8260f740756ff143')
b2sums=('a8538e564bd3b83ed1aa968f8937a6797815474a76054978bec800e4fa1b2d3cc1ec933fdfb03062256deb9ed4e82a83430e05550e9262487234fbb02b566c70')

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
