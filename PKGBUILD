# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tiledb
_pkgver=0.22.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Modern Database Engine for Multi-Modal Data via Sparse and Dense Multidimensional Arrays"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=(MIT)
depends=(
  r-nanotime
  r-rcpp
  r-spdl
  tiledb
)
makedepends=(
  r-rcppint64
)
checkdepends=(
  r-arrow
  r-data.table
  r-nycflights13
  r-palmerpenguins
  r-tinytest
)
optdepends=(
  r-arrow
  r-bit64
  r-curl
  r-data.table
  r-nycflights13
  r-palmerpenguins
  r-simplermarkdown
  r-tibble
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('87b3be22174ace6af2c0ae175ba59291')
b2sums=('4838d8062cae14e1a267a0fe59cf94b1103c7ddeb3d79c612f9cae46c31391834d4b455825d13d4537a7663d2fcaf52ab95cad98fc70c35fe6d97050bf25aa54')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
