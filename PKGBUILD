# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rfast
_pkgver=2.1.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('ba455888bd71d3cbce27d29be5f1948c')
b2sums=('d1de20c4b2985c55d93e84ba4c22fab142d9a1055090e3ae8378675956306418e6c6a01366ed1448b154ed12b8d68ca9fa6a6d42e800cb9b5a973d5f35dbae6d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
