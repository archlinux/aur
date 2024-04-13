# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SCATEData
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d2cc1103c55f35abcd3a593998e64e62')
b2sums=('a67dc8f5b21ae22dfe8a4c78905afef2bd9061f0b8362e69a42d98354751a987cd8cfa7c5533b70264a317f22c8450c94af1f6aaf82078d4bb27b0d90e3c2308')

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
