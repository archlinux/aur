# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RcppThread
_pkgver=2.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="R-Friendly Threading in C++"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r
)
optdepends=(
  r-r.rsp
  r-rcpp
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ee06063b597cd88ad5d1034aba7efd90')
b2sums=('6068397785cad365c5f709bc83c4b916be1e5d38973427b647d30a287800c7693a6cc924bd6ef5bded8e9f0c1c777148a0793b035405e3c2d71d032f56c3dd09')

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
