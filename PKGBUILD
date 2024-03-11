# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GFA
_pkgver=1.0.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Group Factor Analysis"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('120596244929ae4a15d1266567bc2b75')
b2sums=('e51a23c416022af743db7bbbb39a06638dfede53a1bd9058d3875eb1b4d0e04a52a8fadf334d9a197a9ea0a684d47e547b2b7e30d1701e50ad5dc3611aaed064')

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
