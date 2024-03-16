# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=memuse
_pkgver=4.2-3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Memory Estimation Utilities"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('BSD-2-Clause')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7cd4b619bf949070f16421d004141aa9')
b2sums=('7b2adf7679600e9111ad5fec4eb5cb071f031dfdf8bba68773298a25cd6256bb39b5468eda5fdd401f4ee0de036b5955363e0da2d30d0b9c837112dad8888c58')

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
