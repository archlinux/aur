# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=abdiv
_pkgver=0.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Alpha and Beta Diversity Measures"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-ape
)
optdepends=(
  r-testthat
  r-vegan
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('80931c0ca85ba5386000bf617552c5ce')
b2sums=('531122112297ce086c5b1266a350a6a9001b4b27565b86f70b3770f1220380835e2f1ab4c0678e9dbbb47a0573d6901cf82e217981fa7de1a6006a38ba15ccbc')

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
