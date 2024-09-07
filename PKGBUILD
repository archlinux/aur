# Maintainer: Carson Buttars <carsonbuttars13@gmail.com

_pkgname=GPfit
_pkgver=1.0-8
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
md5sums=('ddfa4fdf1446004a7b75289eb81e8548')
b2sums=('6c62146c0cabac40fef457b497e327d0fcf542a9f324c612a65146958886e1daca174bbf91a29913e1b6a45f15cd0e2b75552e438459a81f7e20b6ee25877a5d')

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
