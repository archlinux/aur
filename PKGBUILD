# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MindOnStats
_pkgver=0.11
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data sets included in Utts and Heckard's Mind on Statistics"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9bd4188808198984d7e948ed78492997')
sha256sums=('bf22c0febd29cb94b20efea0cd39def32b7be80d684a01f828cb4160c92e298d')
b2sums=('17bfa3b07ad8f49219f546c75b01e3694c5102030100d879157f46790533815954e9630ae8a123d2aa5d0070b3aeb9f8286ac0db7ed8403fbd6a284bc3dace14')

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
