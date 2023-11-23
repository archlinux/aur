# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=strex
_pkgver=1.6.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Extra String Manipulation Functions"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL3)
depends=(
  r-checkmate
  r-magrittr
  r-rlang
  r-stringi
  r-stringr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-bench
  r-covr
  r-knitr
  r-purrr
  r-rmarkdown
  r-spelling
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0637b9abacf65f22add7a9cf9efb5039')
sha256sums=('38fa8de9a7c55bffe8b47bdd57b8df7646064964737b44bc784b14e076fee5ef')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
