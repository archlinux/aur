# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=analogue
_pkgver=0.18.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Analogue and Weighted Averaging Methods for Palaeoecology"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
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
md5sums=('384cbf7c6b95474c207e8a330d23806e')
b2sums=('28a85c0468297fca44d2096ca77305360893f562e15540c7ec2ddc3c5c118b597d2952e1893018ab2578c0f397a2c599a6ae9c385632cefc5abb1ea8dc58eac9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla test-all.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
