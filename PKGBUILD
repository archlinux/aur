# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=aws
_pkgver=2.5-5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Adaptive Weights Smoothing"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  blas
  lapack
  r-awsmethods
  r-gsl
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3868993c01ade46eb9289dbb6193df85')
b2sums=('e82ae67d0665b15b89d0e192c410c475b359728ee5536d8a7bf00ef7e00f831db7fe1364e19a8b184a828ecdf33ea5ff9a289f4e21ef5b6f439a96326f94c049')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
