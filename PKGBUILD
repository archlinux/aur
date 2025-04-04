# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=analogue
_pkgver=0.18.0
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
md5sums=('3c6f153bdb37778c9e93738862e85597')
b2sums=('f29b02ea2027f54400157f2166f653436bfacaa1bb76b047c35bdfa6029edec02ecbc6dc0962d805b15ed2c1209fceba65a82179bac6f44aa69b94935df1ab2c')

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
