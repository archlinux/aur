# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rfast
_pkgver=2.0.9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A Collection of Efficient and Extremely Fast R Functions"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
depends=(
  blas
  lapack
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
md5sums=('6fd9f8416dedf846b7d5cddf83cfd906')
sha256sums=('ffcf2a9df9c089f4719e483743a01ccba06e4f0b65580231fbe1142bf12c548a')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
