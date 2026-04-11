# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SeuratObject
_pkgver=5.4.0
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
md5sums=('bd4458cced57f2ebe9f11a07d206821e')
b2sums=('d2b3ee56f79c4a2698b100b634eced9add15a1dbb4b82546afae70f3490dd8d7b8e2e6d242d5088012f054b71d51bb2db822765ccc1a15f9254515bc375082e7')

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
