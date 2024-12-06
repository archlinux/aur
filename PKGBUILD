# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=seriation
_pkgver=1.5.7
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
md5sums=('ea9e045fd7a56b81396361042e614e9e')
b2sums=('21ab995252e4809c35ac697c939bae468d5a4d00f213b7430ee2e6c32fb83dcdb47fe49ec2f41483085758e3af7fc7c96eb1f05aaa891179ea72f3ea72bc47b7')

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
