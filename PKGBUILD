# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DeMAND
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="DeMAND"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LicenseRef-DeMAND')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ccb354bddebbebda6c42453810f10e70')
b2sums=('ff3cbfef53e18bd1e024f9ab55b3d239517dd7f95f21f14d08850ee2683fabcad6afd8f4b99701ae231f20b6c2e0680f2f99b9f4c91b6d1180e522e4207be932')

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
