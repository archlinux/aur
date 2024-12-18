# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=VegaMC
_pkgver=3.44.0
pkgname=r-${_pkgname,,}
pkgver=3.44.0
pkgrel=1
pkgdesc='VegaMC: A Package Implementing a Variational Piecewise Smooth Model for Identification of Driver Chromosomal Imbalances in Cancer'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biomart
)
makedepends=(
  patch
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix_globals.patch")
sha256sums=('526a936aa44b2ca8a9669c9615a701d2e2697f74f640b9227afb9f830f737460'
            'a45787150bdf297482a8623da5ab7257adb2828108d797a688abd73e87490233')

#prepare() {
#  cd "${srcdir}/${_pkgname}"

  # fix global variables overlap until it will be fixed in upstream
#  patch -Np0 -i "${srcdir}/fix_globals.patch"
#}

build() {
  # create staging directory for installation
  mkdir -p "${srcdir}/staged"

  R CMD INSTALL "${_pkgname}" -l "${srcdir}/staged"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${srcdir}/staged/${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
