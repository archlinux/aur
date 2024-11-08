# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=minty
_pkgver=0.0.4
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
md5sums=('96a8a0079ba3300c2ceac6cdd1b60c9e')
b2sums=('9bc323fafb570ab211a85e7bc9164412f01b9b2f68b981dcc8741fcc3c901560dc05de5572fd622f28b94ed01e22eb23716dee8406627d812cadec97a741c8c4')

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
