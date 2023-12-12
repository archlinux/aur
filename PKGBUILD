# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=seriation
_pkgver=1.5.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Infrastructure for Ordering Objects Using Seriation"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL3)
depends=(
  r-ca
  r-colorspace
  r-foreach
  r-gclus
  r-qap
  r-registry
  r-tsp
  r-vegan
)
makedepends=(
  gcc-fortran
)
checkdepends=(
  r-dbscan
  r-dendextend
  r-ga
  r-rtsne
  r-testthat
  r-umap
)
optdepends=(
  r-dbscan
  r-dendextend
  r-dendser
  r-doparallel
  r-ga
  r-ggplot2
  r-keras
  r-rtsne
  r-scales
  r-smacof
  r-tensorflow
  r-testthat
  r-umap
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e44c7b7bfe1340609df38646cbdccf3c')
sha256sums=('d2339c52f581d1970ecf57c874a0d95810e9cd5f2fcde8f17376964c8e21339f')

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
