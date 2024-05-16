# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=qs
_pkgver=0.26.3
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
md5sums=('49f529e362cd9eeb05f4622a508f1db3')
b2sums=('f1a481d92759e2ff6a9bbbc58c51582e653f045b9c54dfb0ec2e43b1747b50813fa340d43645dccb2f40782a8a43b7d61e20a3d7c5691120f3419267f85b67c3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
