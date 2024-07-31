# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=yesno
_pkgver=0.1.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Ask Yes-No Questions"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d63d49d88110918f203dcd9241602145')
b2sums=('590f06702f559190aee9394f14f74e7cacceb0f74faad3d8fe77258cd704ecbd4eb07cf695ea2e1bf7325e82e6f6716790a50ee661f87355912cef2945eae67e')

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
