# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fastcluster
_pkgver=1.2.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Fast Hierarchical Clustering Routines for R and 'Python'"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('BSD-2-Clause OR GPL-2.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3c0b40890f78a844cc0a6209454496bf')
b2sums=('4bfc8d39974cf90b38f57457262e80bd14f9fa6b5a24569fc2993b368d04745e93d1ffa9a51ebd5fdf623adebe540196c74302b9e6e270846334d7650c19f0f6')

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
