# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rfast
_pkgver=2.1.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A Collection of Efficient and Extremely Fast R Functions"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  blas
  lapack
  onetbb
  r-rcpp
  r-rcppparallel
  r-rcppziggurat
)
makedepends=(
  r-rcpparmadillo
)
optdepends=(
  r-philentropy
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fea567ece464fb726bb1512b97e75073')
b2sums=('336f83dcd526621443be836707a9cdca35d9c159c74ea49ef746983664d2fae82c45c4fbe5d19b190f144c1e189f247744735bccee07181e58d77314234b4933')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
