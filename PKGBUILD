# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SeuratObject
_pkgver=5.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Data Structures for Single Cell Data"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(MIT)
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
# temporarily use old version until r-matrix is updated to >=1.6.3
source=("https://cran.r-project.org/src/contrib/Archive/$_pkgname/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2fb91d97b91d012a7a234954a8b9b995')
sha256sums=('2dd95f3b2698ca598c582381ef94683977e2a3402eceffff3fea60aed9289972')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
