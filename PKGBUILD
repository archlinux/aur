# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SeuratObject
_pkgver=5.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data Structures for Single Cell Data"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-future
  r-future.apply
  r-generics
  r-lifecycle
  r-progressr
  r-rcpp
  r-rlang
  r-sp
  r-spam
)
makedepends=(
  r-rcppeigen
)
optdepends=(
  r-bpcells
  r-delayedarray
  r-fs
  r-ggplot2
  r-hdf5array
  r-rmarkdown
  r-sf
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a1b6b337accbe962c59bd0f9cdf957e4')
b2sums=('0f839cc1a584a5b14c82cda89becf7d2ddaa9280ce994236660f4a8250ecef24e70f1aab9ac2ca15c3b3efa05e5904db65c5dd27d5767053e0e84289272936ea')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
