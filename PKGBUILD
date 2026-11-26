# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=KOdata
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="LINCS Knock-Out Data Package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f1b3efa6a336402036708240f119e35e')
b2sums=('79234c358e762c41caf04834822a1d9eab4e9fcb669fa673253d549016042b6b792e9c51405ac9cf0a5995850b8b48931dead2984cc08b7d00e33139ce251075')

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
