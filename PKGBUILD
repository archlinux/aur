# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fastcluster
_pkgver=1.2.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fast Hierarchical Clustering Routines for R and 'Python'"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('BSD-2-Clause OR GPL-2.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('252ea997088794972aac679fb6772530')
b2sums=('03b4dc137a16511a99f50bc42b897277521fe7aecf9b6979e93aaa353735990585e5b568dba3f8fca24600922623dcbd7cfe0237a5c316fba6160d15e6480856')

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
