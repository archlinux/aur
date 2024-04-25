# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=animation
_pkgver=2.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
  r-testit
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('57e4bbd7c116ac0e6077eb613aa5ecf4')
b2sums=('45b9d6b5d6be782b568bde5412f1dc784d0ed2b3c74e25d2ac32a337ebc3eca733c2ca46833e034684e531833db6f3bb67947cacbf4342a65bae67cc6d67a57a')

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
