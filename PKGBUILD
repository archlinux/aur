# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rfast
_pkgver=2.1.5.2
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
  r-zigg
)
makedepends=(
  r-rcpparmadillo
)
optdepends=(
  r-philentropy
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4ea64e4083993f357cd6782fc8846191')
b2sums=('3f392aece70855e58a57226276cc5047a10840263134ac707963dfcce73d2ac26140c8e5d5c9b3efd9004988a0e7dfa3cd27abbda583ca1af8a4cb3b178c5069')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
