# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=duckdb
_pkgver=1.5.4
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
md5sums=('7c0bb8aaeb66bf1cc4f751bca719aff8')
b2sums=('e5406e245881ef6613b0527b71303eb9ace59e2bffa2e0a91f0411cc9bd97ec8f6909c9d79489af40a23ae8cce73ba9b076f1792819da03c10e3f969075e5e21')

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
