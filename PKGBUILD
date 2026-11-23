# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=animation
_pkgver=2.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A Gallery of Animations in Statistics and Utilities to Create Animations"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-magick
)
checkdepends=(
  r-testit
)
optdepends=(
  'ffmpeg: saveVideo()'
  'swftools: saveSWF()'
  'texlive-bin: saveLatex()'
  r-cairo
  r-fimport
  r-rgl
  r-testit
  r-zoo
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('cc97a3b06e57a12fa0415fa8cbc68fc5')
b2sums=('55a9ad6a9940c376df97f46b51e07c652b94e6d510cbfe58434905abc0cb03a58c7561463e9df4a9d835beb92fedd13b0b20b59038002dd0a1eb3d1f756ce528')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" _R_CHECK_PACKAGE_NAME_=false Rscript --vanilla run-all.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
