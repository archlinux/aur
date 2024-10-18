# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=leidenAlg
_pkgver=1.1.4
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
md5sums=('337f02f2678ba5bd469eae07bdd0df96')
b2sums=('139254127eed0d574b3381d669866a20c7739b4d4ee9139eced1445669a44b9ec79ad2b6117b814b21b185e4ac438ee94f3d298097dcda9125d1d687c90e4522')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
