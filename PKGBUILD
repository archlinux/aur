# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fastcluster
_pkgver=1.3.0
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
md5sums=('df9c300dce25b7755254f49ba6d69720')
b2sums=('bf50583f8424b3454745cf7882b95002fc143c184fc206db4b4c5a2f0d618939c2d2d423b7b365101110d7fce21ca19fbb3721072daa5437c7c615fa847b9794')

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
