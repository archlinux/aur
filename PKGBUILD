# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SeuratObject
_pkgver=5.3.0
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
md5sums=('19d3fa5f98c52f4e7e77b70da76b8867')
b2sums=('2b327ff03258acbfab999dcc7a1918743ab2e539f1e38cfe4c56d0850a3852d5f7d0c04d7877251bc0506b8d499f1b0b5b6d0d7b792c87062a677ea18da62dab')

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
