# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lfa
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=1
pkgdesc='Logistic Factor Analysis for Categorical Data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-corpcor
)
optdepends=(
  r-ggplot2
  r-knitr
)
makedepends=(git)
source=("git+https://git.bioconductor.org/packages/${_pkgname}"
"001-R430.patch::https://github.com/StoreyLab/lfa/commit/8f3a885eaeabe6b7201d3542be27ab86a65c2a22.patch"
)
sha256sums=('SKIP'
            '6798aed2a76934262d2b6fd521dfba617ec6909cff78ca647568f6b8afc420ac')

prepare() {
  cd "${srcdir}/${_pkgname}"
  # see https://github.com/StoreyLab/lfa/issues/6
  # ignore failed part of the patch.
  patch -p1 -i "${srcdir}/001-R430.patch" || true
  cd $srcdir
  tar -czf ${_pkgname}_${_pkgver}.tar.gz "${_pkgname}"
}

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
