# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=waveslim
_pkgver=1.8.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Basic Wavelet Routines for One-, Two-, and Three-Dimensional Signal Processing"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('BSD-3-Clause')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
optdepends=(
  r-covr
  r-fftw
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7af311a2567fd72a3080a2762aa1b929')
b2sums=('cf58f1fce5fa5aeb88d86fcdae916500763e4210c9c0b5d92279e490a8590b7694b6d48076664cd44a6b8613a93c4b3f6d7b22bc528e09cf2f1d45987d00fed5')

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
