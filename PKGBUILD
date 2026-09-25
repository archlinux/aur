# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=leidenAlg
_pkgver=1.1.8
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
md5sums=('16ed8aff53c03363d92758d4bc069c5f')
b2sums=('90afd24ab6b9c78216c99c1eae3a7b719d48e52cd45aeb36e5dcdfd76c62a1e0075d3a1a9537f075e7662ff182a20f2e1bae0a0fb3a33aaedef80a3fa19d7870')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
