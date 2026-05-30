# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rapidjsonr
_pkgver=1.2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="'Rapidjson' C++ Header Files"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r
  rapidjson
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('aefd169bd6f987c34377dea30de10b4e')
b2sums=('1e9e392857ea0ea6084f76e778d05f57722f2395f92026915d556d9f526f700ebecc296039772615ba98d7685b09fe4e92847615dc552cba0e64db57e24cce70')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"

  # symlink to system rapidjson headers
  cd "$pkgdir/usr/lib/R/library/$_pkgname/include"
  rm -r rapidjson
  ln -s /usr/include/rapidjson
}
