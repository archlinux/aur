# system requirements: GNU make
# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=h5mread
_pkgver=1.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc="A fast HDF5 reader"
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic-2.0')
depends=(
  r-biocgenerics
  r-iranges
  r-rhdf5
  r-rhdf5filters
  r-s4arrays
  r-s4vectors
  r-sparsearray
)
makedepends=(
  make
  r-rhdf5lib
)
optdepends=(
  r-biocparallel
  r-biocstyle
  r-experimenthub
  r-hdf5array
  r-knitr
  r-rmarkdown
  r-tenxbraindata
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0b63e37635b2934dd42cbe65be34c162')
b2sums=('fd8e3d806025036a34c9795bf0201ea60b8279dd81c3651a1e69e21cef525aab6c00c9a2197e4f34fab9f2cf28630803bd8d5243d270f47be7552822200136e0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
