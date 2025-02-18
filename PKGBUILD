# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=clarabel
_pkgver=0.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interior Point Conic Optimization Solver"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('Apache-2.0')
depends=(
  blas
  lapack
  r
)
makedepends=(
  rust
)
checkdepends=(
  r-tinytest
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a6a274db1cd63566432dee7d1ba47b65')
b2sums=('5af1eedd056048d785caae39283decc6ab438e712cec0163dbe5662c6069d1a10c88e0a5c505856fdbd67e57a463a0e21b97ad9d917a08a165adccbbfeeaa1e1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla tinytest.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
