# Maintainer: Carson Buttars <carsonbuttars13@gmail.com

_pkgname=GPfit
_pkgver=1.0-9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=5
pkgdesc="Gaussian processes modeling"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-lhs
  r-lattice
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d1a3afbda6c0c9d98231d2e99a28483f')
b2sums=('baca5f19dff19134bc2d991518b02515554454c9fdac38c3298ce560cc67857bc074b0c8ba19069e3465d9fd03c9f5f2d6e89f7a34d7837d8e60e2a4e485938a')

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
}
