# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SCATE
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Single-cell ATAC-seq Signal Extraction and Enhancement"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-genomicalignments
  r-genomicranges
  r-mclust
  r-preprocesscore
  r-rtsne
  r-scatedata
  r-splines2
  r-xgboost
)
optdepends=(
  r-ggplot2
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1336788dfbcdb94defd8b4d36b7b13ec')
b2sums=('0f95909edd705939ba6ba6b5fa9c4f1fa7011a66cc069516856c446708b4f4ae445b029650a0b12e7950b504cd0a3702e598c7677a2ddb0b7466c0cebc471047')

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
