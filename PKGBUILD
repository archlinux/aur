# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mratios
_pkgver=1.4.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Ratios of Coefficients in the General Linear Model"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL-2.0-only')
depends=(
  r-multcomp
  r-mvtnorm
  r-survpresmooth
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d149775b424e2540090aa039867effe2')
b2sums=('d87fa86adcd63d131d0c0008b7e10491d0b3b0b27ae889c29073602ea19de5b5c31a25129c267b0e1733e56423d3ec90604de8d1d0cf93b8b240f4d6a3ab0637')

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
