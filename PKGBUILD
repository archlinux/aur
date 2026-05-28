# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=rSpectral
_pkgver=1.0.0.16
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Spectral Modularity Clustering"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-graph
  r-igraph
  r-rcpp
  r-rdpack
  blas
  lapack
)
makedepends=(
  r-rcpparmadillo
)
checkdepends=(
  r-igraphdata
  r-testthat
)
optdepends=(
  r-igraphdata
  r-rcolorbrewer
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4a9d777c2583bcb65199ea61c283e0cb')
b2sums=('541bb148c460c92034d0998392d591f09046406b6c695c947399ca45448b099a5add4ad9263ddf86eb4017b0d56c9457bf5ff8c82de5b0c9602a701bf80ad7d5')

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
