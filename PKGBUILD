# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=epitools
_pkgver=0.5-10.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=0
pkgdesc="Epidemiology Tools"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5687c399ed86c5de206164cd449e42ba')
sha256sums=('b418854de1fcedd126f3bf19dc27e8a71ee6efae5371098ab64a53a2d51d164b')

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
