# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=prismatic
_pkgver=1.1.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Color Manipulation Tools"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-farver
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-cli
  r-covr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6b429cc6f779cd2bbbbdda70b74f3022')
b2sums=('3d8e16620cfa85b330e167cc562fb1a5eeaa574c81237649d348079c767b68eb6e6404e0b14c805dc63c2fead4dbd21b72107969f75ac58f6f0c622fdeda1df4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
