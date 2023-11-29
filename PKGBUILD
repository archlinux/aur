# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=rSpectral
_pkgver=1.0.0.10
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Spectral Modularity Clustering"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL2)
depends=(
  blas
  lapack
  r-graph
  r-igraph
  r-rcpp
  r-rdpack
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
  r-rgraphviz
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('53afeed2a8faf838905764c2e67b968a')
sha256sums=('ddc03a1a1c11088f66ad55613ae389c252c60e819570c998a8cf2832a9f4cf89')

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
