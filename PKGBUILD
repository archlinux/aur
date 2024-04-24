# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=trust
_pkgver=0.1-8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=10
pkgdesc="Trust Region Optimization"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0978e8fa147d244ba4dacfe8dfee2403')
b2sums=('be563f0eb3c79953be2683809b906d2cf2faa9a9ae8aa931be4f628a57823f39ca02430facf5cdb69822c5dea460f2ba91cf654b0519b08ba50044b063453eee')

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
