# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=rSpectral
_pkgver=1.0.0.10
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Spectral Modularity Clustering"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
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
b2sums=('70e4d9994d541d00ef3739457831bbae50201baca48cc1639558ef06d9a4e7a95052c9b3d096d7065b30e69538125bcf131ebab4593fba7bdf1069f4e40ac593')

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
