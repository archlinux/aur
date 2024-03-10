# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=qs
_pkgver=0.26.1
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
md5sums=('ee0fad99d74c0798fcea6659f988b2d1')
b2sums=('d8e0e33fd43c8ec22de9c0da84d610f8539def1048fef03deeedb55b3ab15508302685c8ba396b47f0657c59df3f1055e4a2400f21160dbe25e8a12e29495f01')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
