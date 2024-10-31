# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rhdf5
_pkgver=2.50.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="R Interface to HDF5"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  curl
  openssl
  r-rhdf5filters
  r-rhdf5lib
  zlib
)
optdepends=(
  r-bench
  r-biocparallel
  r-biocstyle
  r-bit64
  r-dplyr
  r-ggplot2
  r-knitr
  r-mockery
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3b8b33f3ee9a260cceefab2911d1cd63')
b2sums=('2f32066125ea27a7eae61ad858aab486e050978e4a43afd337c919dda0967e0f05c42371784a48130acb2d9bafefc272125444ee573d6829541636912c05164d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
