# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgname=osqp
_pkgver=0.6.3.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Quadratic Programming Solver using the 'OSQP' Library"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(Apache)
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
sha256sums=('18543b329a42be0f419dff4aa42f4401c2afb18f46276ce359853494dd803244')

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
}
