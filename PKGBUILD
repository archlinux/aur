# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgname=osqp
_pkgver=0.6.3.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Quadratic Programming Solver using the 'OSQP' Library"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('Apache-2.0')
depends=(
  r-r6
  r-rcpp
)
makedepends=(
  cmake
)
checkdepends=(
  r-slam
  r-testthat
)
optdepends=(
  r-slam
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d6b45409799ce483514cada5818fa47a')
b2sums=('34f744c65d04a2213721fd82b1116bae8d3c8f748a5dd164e77abf89be24a115c482c79e6d99b6bd89e438019badde7015f5b216a4e69cfb1369f1defe335877')

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
