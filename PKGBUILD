# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Cairo
_pkgver=1.6-5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="R Graphics Device using Cairo Graphics Library for Creating High-Quality Bitmap (PNG, JPEG, TIFF), Vector (PDF, SVG, PostScript) and Display (X11 and Win32) Output"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only OR GPL-3.0-only')
depends=(
  cairo
  freetype2
  harfbuzz
  harfbuzz-icu
  icu
  libjpeg-turbo
  libtiff
  libx11
  r
)
optdepends=(
  r-png
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c1909e48d6ab36e5f813d1407e8fabe9')
b2sums=('9d7e36be305f0bcdaa68054da6c1a4a9ade287d11a616fb435b27c0514cd96056800fb9571200f24544baca3c235663428134e4f989127cbac410e0492270041')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
