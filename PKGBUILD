# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=wdm
_pkgver=0.2.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Weighted Dependence Measures"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(MIT)
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
sha256sums=('e2d19c04ea2fb9394cc2b61899c7fd21ae7c6d5825bfdcb74822c7243cd335d3')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
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
