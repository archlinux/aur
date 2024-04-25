# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=analogue
_pkgver=0.17-6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Analogue and Weighted Averaging Methods for Palaeoecology"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-brglm
  r-princurve
  r-vegan
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f4fcf06d896fa95e76d79da19c19e6ff')
b2sums=('15146a90a5893e2ee1d11fb918edb106c9a3cc0f5d84fe012fd879a34f01fd50fe704c7bfb50fce333f0fd33280d693101c351fe0321ff618ae44ec6a1c6b876')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla test-all.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
