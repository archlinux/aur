# system requirements: GNU make
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=qrqc
_pkgver=1.54.0
pkgname=r-${_pkgname,,}
pkgver=1.54.0
pkgrel=1
pkgdesc='Quick Read Quality Control'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biostrings
  r-biovizbase
  r-brew
  r-ggplot2
  r-plyr
  r-reshape
  r-rhtslib
  r-testthat
  r-xtable
)
makedepends=(git)
source=("git+https://git.bioconductor.org/packages/qrqc")
sha256sums=('SKIP')

prepare(){
  cd $srcdir/${_pkgname}/src
  # For R 4.3.0+
  sed -i 's|SINT_MAX|INT_MAX|g' io.c
  cd $srcdir
  tar -czf $_pkgname-$_pkgver.tar.gz ${_pkgname}
}

build() {
  R CMD INSTALL ${_pkgname}-${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
