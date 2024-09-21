# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=analogue
_pkgver=0.17-7
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
md5sums=('7f80266172812652bbddcb84e342561d')
b2sums=('7199e6ede541874c8dd02fe2ec37d3191d6a5e0a1c1c3419b938c521c7dd74db7bfb499890bf4e9b8f03245b8127f1c63d8bee3ae554db5c5325920659b1b1c2')

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
