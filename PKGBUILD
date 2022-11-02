# system requirements: GNU make
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lpsymphony
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
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
sha256sums=('f1df3b8c3fde044c9de031c15064789836445ebfdafff8822e6331dd3f22d467')

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
