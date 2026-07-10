# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=duckdb
_pkgver=1.5.4.3
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
  r-nanoarrow
  r-rlang
  r-sf
  r-testthat
  r-tibble
  r-vctrs
  r-withr
  r-wk
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('aa8f1157f309fa413eada99f79789394')
b2sums=('c84e79e9c45a38dca44eace4db2cf34749191041dccde6a5619877515428c0ad1b0aa0c0594137d829d2091f1df8af66d39aee01764db9090528177a6aa5be20')

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
