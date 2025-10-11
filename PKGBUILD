# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=import
_pkgver=1.3.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An Import Mechanism for R"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r
)
optdepends=(
  r-knitr
  r-magrittr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('06a28f3432865296596392c4f5fd1608')
b2sums=('836156aef5cd16f7643d0c52fdc4fb2e45a7ef677909a12573043782a4e74f22d8619d0a99358f088753ca552e9a2587330cc97266382f7aeaeb791b3941632c')

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
