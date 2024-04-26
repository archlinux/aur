# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ssc
_pkgver=2.1-0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Semi-Supervised Classification Methods"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-proxy
)
checkdepends=(
  r-caret
  r-kernlab
  r-testthat
)
optdepends=(
  r-c50
  r-caret
  r-e1071
  r-kernlab
  r-r.rsp
  r-stringi
  r-testthat
  r-timedate
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('122e647cfaf26507b92a546dab33e053')
b2sums=('3cdd363988a8c0a741f4fdfc92594773572019eb77edd045b0074646ca6fe5246fb50f0285574f1ff73b672cdff313e9cf707f7dcd0e2c56590f305e45f6abd6')

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
}
