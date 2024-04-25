# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=rdist
_pkgver=0.0.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Calculate Pairwise Distances"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  blas
  r-rcpp
)
makedepends=(
  r-rcpparmadillo
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('394847a1782d753eaa4fd196ba2b569e')
b2sums=('89536697e1af9cb4de58d36b976707f153f7aa1b929e69edfabda37f1d7a7f5a18026d1186460585498d7d33ff317e67e8a83d00cbc04307198cb31674f59801')

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
