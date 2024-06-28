# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=clarabel
_pkgver=0.9.0
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
options=(!debug) # debug info generation results in an internal compiler error
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6faf835bdac2c047732b8455e09f31be')
b2sums=('d5cc2fdd8162f07c76a9d310944902cbaa49ef2d11902079738b211be5b3c4fa74e0d77134b13cc2a491a1880d4f701b41bcb125bbc4fe9af9bff6ee30324523')

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
