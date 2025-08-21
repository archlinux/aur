# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=seriation
_pkgver=1.5.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Infrastructure for Ordering Objects Using Seriation"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
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
md5sums=('8efbd17b971359e43c9c2356171d9016')
b2sums=('8dd51eba8782518a521f2d775073cbb564a517ac6e16f3ec48c7a5034ef31f1cc6134f945263d95ba0e69669546876cfabb78cc81451567599cceacc7e527c45')

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
