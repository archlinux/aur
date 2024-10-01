# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=leidenAlg
_pkgver=1.1.3
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
md5sums=('1cfeda2c0df7668f18500ae594019a08')
b2sums=('218c83bf69b0e15f77cf447020d44e4ecaf2e803cee80d2b0df6acee9913c74a35fcc02cb2f27db90ff0d70ce62beb3e760295741c3de91816381bcab9e3d240')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
