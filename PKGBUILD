# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bigD
_pkgver=0.3.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Flexibly Format Dates and Times to a Given Locale"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r
)
optdepends=(
  r-covr
  r-testthat
  r-tibble
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f293b1d3701b1db0650355ed9bea2e0c')
b2sums=('6460d0705f802445ecebb5d329d5ef84833ba2c349dd9540bc4c583062c0d55ed2a78cabaad691ce0c6b7e7f76ab604d6e5690497b42111e13a274021067c851')

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
