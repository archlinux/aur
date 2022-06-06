# system requirements: GNU make
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lpsymphony
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='Symphony integer linear programming solver in R'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('EPL')
depends=(
  r
  coin-or-asl
  coin-or-clp
  coin-or-coinutils
  coin-or-osi
  coin-or-cgl
  make
  glpk
)
optdepends=(
  r-biocstyle
  r-knitr
  r-slam
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6f8c96972863d3c1ed8f55b937ceaf4e43832d59350d0231e2dfafa23502874d')

prepare() {
  sed -i 's#CXXFLAGS="-w -g -O2"#CXXFLAGS="-w -g -O2 -I/usr/include/coin"#' "${srcdir}/${_pkgname}/configure"
  tar cfz "${_pkgname}.tar.gz" "${_pkgname}"
}

build() {
  #R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
  R CMD INSTALL ${_pkgname}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
