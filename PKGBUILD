# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SCATEData
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Data for SCATE (Single-cell ATAC-seq Signal Extraction and Enhancement)"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-experimenthub
  r-genomicalignments
  r-genomicranges
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/3.17/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('dd2241d946202b696c0a706b906425f4')
b2sums=('a3e8aeaa2a5de51ccb7aadd2e840c419138f279b13c1feec7e445036785ddcd25af77cd5b9ec2dfbd77aa9f3e309dbdb6fc9288a763de8682f90bbcd6cf58757')

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
