# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=minty
_pkgver=0.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Minimal Type Guesser"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-tzdb
)
makedepends=(
  r-cpp11
)
checkdepends=(
  r-hms
  r-testthat
)
optdepends=(
  r-hms
  r-knitr
  r-readr
  r-stringi
  r-testthat
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('309f8abcb23fa366a5777bcd4900b235')
b2sums=('6cb0691e1c6c494a5b9c63e7ecfcbc4b108bea6bcd2fc845ca73c0d060a4af784c00bdc73b7234db0b64aa90382d3a0ad136b383eb844b1220da697c2646a09c')

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
