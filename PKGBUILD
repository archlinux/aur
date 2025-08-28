# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SeuratObject
_pkgver=5.2.0
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
md5sums=('b81127abbba7b519cfb305b275fbe5fb')
b2sums=('7f084bf52b78e93c75d91e9b7fcf2cd805d83cdb337f2dd1aaa627633c3a28c5287c538bbe6fca49d8eaf63eb3633aff1d7ba15894a1c92987e082024bb8b4ad')

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
