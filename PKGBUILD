# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RcppXPtrUtils
_pkgver=0.1.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="XPtr Add-Ons for 'Rcpp'"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=(MIT)
depends=(
  r-rcpp
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-inline
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3f646f0d2c93a5bfec9636a7e9b63c26')
b2sums=('2d9371d20acef699663b94243f8e22a8b087c2ff1be37ae75b0c68f248dcd14ff4c3213223f900cd102ee5c58a41d9a62e0c0542f69e3e95592c157a7c8418d2')

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
