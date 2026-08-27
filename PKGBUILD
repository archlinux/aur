# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=clarabel
_pkgver=0.11.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interior Point Conic Optimization Solver"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('Apache-2.0')
depends=(
  r-cli
  blas
  lapack
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
md5sums=('192e92c684776dfa34e7a294c3e674ef')
b2sums=('112ac6ad2d8ee9931293e4ba42a6325a9002552fbd2342bab5bc0a4f63a8d99537237fba08ab937198dbb26a3c227c2e8edd612f2f7490dc3c98d40d7fc19583')

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
