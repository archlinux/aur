# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=genArise
_pkgver=1.88.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Microarray Analysis tool"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LicenseRef-genArise')
depends=(
  r-locfit
  r-tkrplot
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5253d9749b7f17e69ae0e71e7f1c22bc')
b2sums=('6e15a0a39421897aaea78115d9ffa89f46823db27bfc9bdce3d46f612400457ca76e3a9ead683abee5eb7c25d9594b959ea3b726bcf0f70eed15ebfb4f32880c')

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
