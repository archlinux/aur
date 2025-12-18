# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=rSpectral
_pkgver=1.0.0.14
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('cff3e53e671acd337b01a5e0ef2776b3')
b2sums=('a53a2c6cc14805260b3de9c78c6c52b5afca009580b8bbb40660a502cfb7c7a76a12a0413627b507daa2bd5f6b77b6630636a00760814f16f47a5757ae78e578')

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
