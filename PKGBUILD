# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rapidjsonr
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="'Rapidjson' C++ Header Files"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=(MIT)
depends=(
  r
  rapidjson
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('92b93b896fc9b288d4cb7a32def81144')
b2sums=('fd09a221684fe0bc015cf287cd2ae492604f5901b3b6870b2ce76b5b869cb76942064c882ca34d6f53cc879fb5aeba9740f9895b2ae0117b45185a2a8e93c557')

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
