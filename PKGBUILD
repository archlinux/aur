# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=seriation
_pkgver=1.5.5
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
md5sums=('4bec976b98f62f19d5e4c7b5be4e2ea2')
b2sums=('6f9b30e349445ec2b7e618b17f4efeda5a8ad1e401c5c137bba3012d83a9f48efc165bc5732669255146cce99b14548fe723769b824d891130e02de65d762d38')

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
