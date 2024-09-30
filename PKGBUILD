# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=aws
_pkgver=2.5-6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('14b395c784e466ca9f098e27aa276f6a')
b2sums=('71160a571bb2b163f769370c54c8364ac626f9ae50835da482713573d0637cc9efde1caf9940b5fba4634bd6c5198e41c12b2bbaab5a564eee86f21f58beffda')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
