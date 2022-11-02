# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CancerInSilico
_pkgver=2.18.0
pkgname=r-${_pkgname,,}
pkgver=2.18.0
pkgrel=1
pkgdesc='An R interface for computational modeling of tumor progression'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-bh
  r-rcpp
)
optdepends=(
  r-biocstyle
  r-gplots
  r-knitr
  r-rgl
  r-rmarkdown
  r-rtsne
  r-testthat
  r-viridis
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9ed927e877b8741e80c894e69dae7e49e409cd8611ae348f5b6d64cb11faeb6b')

prepare() {
  # replace SIGSTKSZ with a constant number
  sed -i "s,SIGSTKSZ,8192,g" "${_pkgname}/src/Tests/catch.h"
  tar cfz "${_pkgname}.tar.gz" "${_pkgname}"
}

build() {
  # R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
  R CMD INSTALL ${_pkgname}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
