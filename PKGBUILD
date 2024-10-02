# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=qs
_pkgver=0.27.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Quick Serialization of R Objects"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  lz4
  r-rapiserialize
  r-rcpp
  r-stringfish
  zstd
)
makedepends=(
  r-bh
)
optdepends=(
  r-data.table
  r-dplyr
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0896e941cb93ecbf53b3cc611546909b')
b2sums=('03127f3bbab5da72023ee078085f517ce316efcacc87792c42aadb32c00efbbc913ec4253f858fef60f313bd3d4fb2cc4bbbdf8ce52fbee5d74a2e24532f13c9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
