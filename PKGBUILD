# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RJSONIO
_pkgver=1.3-1.11
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Serialize R Objects to JSON, JavaScript Object Notation"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('BSD-3-Clause')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f7830bcc92035b68f5ea76e931fd653d')
b2sums=('62d712d2b240ce0d9126729eeece3d0d8826d846ef747b937d46b793c42db6c5c99366805260990a74c7101f862568d4d1a1a37e41630f710eb3193155437f37')

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
