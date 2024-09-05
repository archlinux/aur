# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=clarabel
_pkgver=0.9.0.1
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
md5sums=('8060d34194c3c2a320d59fa5c4133c6e')
b2sums=('55148adb22d425e2b8b8eafba684291a30abc60d1b57fb5aaeb6fb70ea0685fae63cc1a4b0871cdbd36028c9574e665385273fa15c5e9a29be7b414195cf44c8')

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
