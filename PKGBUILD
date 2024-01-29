# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tiledb
_pkgver=0.23.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('d2e37cbdcdaad5ba2d6d3cd93aa97dcb')
b2sums=('30b1e7066ac5a9ef4a091b17cff0350f91bc74cb6b2d48cdcb26668ffdcddef006026382b72e76db2d2ed4e790392ec59e3f46a21a54b7994442becafc94a37d')

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
