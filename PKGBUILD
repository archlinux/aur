# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=wdm
_pkgver=0.2.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('53467d0a74a2b78738d526fe078996d9')
b2sums=('83d8565295214a35f559fad927b18355c9281a764a0e547d445a52dc4276ec87b939374bee368836e275aa10bc956be582ebee55187cc5aa7a3fe796828d2ea0')

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
