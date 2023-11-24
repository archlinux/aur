# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=animation
_pkgver=2.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A Gallery of Animations in Statistics and Utilities to Create Animations"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
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
sha256sums=('88418f1b04ec785963bad492f30eb48b05914e9e5d88c7eef705d949cbd7e469')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" _R_CHECK_PACKAGE_NAME_=false Rscript --vanilla run-all.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
