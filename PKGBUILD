# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=analogue
_pkgver=0.17-6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Analogue and Weighted Averaging Methods for Palaeoecology"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL2)
depends=(
  r-brglm
  r-princurve
  r-vegan
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f4fcf06d896fa95e76d79da19c19e6ff')
sha256sums=('71070f4e669b161a8bec355bf678cc94bb78ba87ee0625cbd8cd53b7ac45b030')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla test-all.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
