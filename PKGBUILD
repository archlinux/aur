# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=leidenAlg
_pkgver=1.1.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Implements the Leiden Algorithm via an R Interface"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-igraph
  r-rcpp
  r-sccore
)
makedepends=(
  gcc-fortran
  r-rcpparmadillo
  r-rcppeigen
)
optdepends=(
  r-pbapply
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9ecd5de47175b196a39ca5a4521cedbb')
b2sums=('0289367d6cc81505e1cb2f7f6930150226082ac63352a9c3feab49819cd143625ef0687417d6722d510bda35fe782a13cac5e133fc7e3c018b24e02ef82b6a6a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
