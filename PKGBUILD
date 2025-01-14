# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rhdf5
_pkgver=2.50.2
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
md5sums=('1725e83fe395625f56751151a7bcd4d3')
b2sums=('757496e43c0cf56d18797d6713e5b9226ef38bc072b153c5d3ef1ad68757da6ea2465676d3468857e9a2e0ad57814c69286237bfc7ade88c3b94baa65996b87b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
