# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=stopwords
_pkgver=2.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Multilingual Stopword Lists"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-isocodes
)
optdepends=(
  r-covr
  r-quanteda
  r-spelling
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('91b96c7bee56e9c6fc6a6945cfc47a67')
b2sums=('68fac0df81eddf7433900b2b3909a24cf3f940ce322636657e2bc815d6be4e9e5bdf30d75cd8e44769d2b7d0103bd65aecc84f56d255220f5495472c5b4481ca')

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
