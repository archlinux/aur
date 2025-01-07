# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RcppThread
_pkgver=2.2.0
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
md5sums=('715d9aacca458116f569a3304ebf504e')
b2sums=('75bc7c4ca365f1e4b23eccb49b95be4fa37a254b3e962b22c9cbb5bc6d9ca1ae7b7032b95ff81f332a9c0ff968de5163a3792f533706c5684bf9cf410b9c376a')

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
