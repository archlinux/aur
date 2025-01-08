# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=wdm
_pkgver=0.2.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Weighted Dependence Measures"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-rcpp
)
checkdepends=(
  r-copula
  r-hmisc
  r-testthat
)
optdepends=(
  r-copula
  r-covr
  r-hmisc
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5d95d8e38acf9f5492821eb4171ab7c6')
b2sums=('6f038b455e133d4ca4fd89451dc91de22fb6622b85449a6a692953fb76b33fd969d9e79682eb43fae5852a05ebaa1328e20651ccf386ed3b5031b32cdc1053d0')

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
