# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=minty
_pkgver=0.0.5
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
md5sums=('06f59ecdd85d46ba63b80db3ecced7fa')
b2sums=('c0abb5398dab3709b8c6367df3c789441e80ca9a5977edc91dc1156bd7d7e4f13dd05b4c9c3ce82948a4ca6b1aee2db6c5d149c5594d40f6a249f9fd86bf6724')

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
