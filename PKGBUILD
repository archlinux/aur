# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=waveslim
_pkgver=1.8.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Basic Wavelet Routines for One-, Two-, and Three-Dimensional Signal Processing"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('BSD-3-Clause')
depends=(
  r-multitaper
)
optdepends=(
  r-covr
  r-fftw
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2c6950f68fbd8042a4a28ae002de8600')
b2sums=('548477aa7f73c3963911fc15880e7b49420d5a11e60aac792c5cdddb949ebf90d7f54eac86b3e681481d5b2debd6590825bd2fca91c63ea6062738465a7df0cf')

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
