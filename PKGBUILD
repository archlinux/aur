# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tiledb
_pkgver=0.24.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Modern Database Engine for Multi-Modal Data via Sparse and Dense Multidimensional Arrays"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
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
md5sums=('514305a1b7933bc52631a767816633c7')
b2sums=('52ebc8b697f99cac14abef3706d8506f6d7afdd75b6294785377a89ff41e0d1f80db75e8bfba3d95f81c0fcde71162f98f94af599c1f4771c506bb98e0266f8d')

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
