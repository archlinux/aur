# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=fairness
_pkgver=1.2.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Algorithmic Fairness Metrics"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-caret
  r-devtools
  r-e1071
  r-ggplot2
  r-proc
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9d76842530b3f2d04109786bfee2a333')
b2sums=('5f65184977a8c5e74b66f324fd671542c6b8495ef5c186e6dc7663fa001c0ae7a39ef58fcb043f5b7eebca0e74d2f3780037192b2d8ce8defe863caa7b3d7ba9')

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
