# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=duckdb
_pkgver=1.5.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="DBI Package for the DuckDB Database Management System"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-dbi
)
checkdepends=(
  r-adbcdrivermanager
  r-arrow
  r-clock
  r-dbplyr
  r-dplyr
  r-testthat
)
optdepends=(
  r-adbcdrivermanager
  r-arrow
  r-bit64
  r-callr
  r-clock
  r-dbitest
  r-dbplyr
  r-dplyr
  r-rlang
  r-sf
  r-testthat
  r-tibble
  r-vctrs
  r-withr
  r-wk
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4e01484a093b934a97a02ad802df00b0')
b2sums=('d049bb5707c986b9dbafc388b3b4580a17d593dc7f3759c49caaca08045e2ec455df6bec4c6acbec52a41a05d017442f45c1705242f162f7866119b089336f8c')

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
