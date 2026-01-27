# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=minty
_pkgver=0.0.6
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
md5sums=('86f8ab1d4a93fd186790a37ca55a9301')
b2sums=('7e4fb982a0d53915af425880eb882c143b6bc183c3a86cb8f0c64a89b3e76b34ce6b52e6b7e8afc296ee8733a67181ee04dc60d93b96a6b4eb31712e596e5eeb')

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
