# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=duckdb
_pkgver=1.3.1
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
  r-testthat
  r-tibble
  r-vctrs
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3ce63f56c3d0994032d1ff271f1844ec')
b2sums=('4128af9e2c7ad3da05b93adba641534393273d520fa4ab87fa6ea25f5a885e460a163a553b40aed6f84948aaace0cd024549db936433132a133ff84730717fef')

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
