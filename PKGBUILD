# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=duckdb
_pkgver=1.1.2
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
md5sums=('a48627ba353408a25da720ce05f25ca2')
b2sums=('d1d9fc8a4159f04821e0fb0232f2255d639635dcf1184a30819e7d2c6ba2a70aa5ad0ee5c5559c9d1ba9817de3344ace04e393f3d03445b70be75d1c624e32fb')

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
