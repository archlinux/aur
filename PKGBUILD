# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=leidenAlg
_pkgver=1.1.5
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
md5sums=('202f112b150dd92f107150e04e9e1aff')
b2sums=('a1af6df44c432561354b6a0efcdf11f2a6624c1d00ddcd467490dd72bbc257a604f6729ca42a544c87527a623527536ac3cde016b0e66982b73bd990d9da7ba7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
