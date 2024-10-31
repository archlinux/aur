# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ReactomeGSA
_pkgver=1.20.0
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
md5sums=('9ac75169cf50f17bee67fe2487c30a57')
b2sums=('5be890335b6fd3e9dd4ef8958028a4ceb4b11dd15e6906e22c0971f0681899f9756c8934eafcf9559569c0705b50171e7ddc5ea4fa45b6b184d16bd391e1dc4c')

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
