# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Autotuner
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=5
pkgdesc='Automated parameter selection for untargeted metabolomics data processing'
arch=('any')
url="https://bioconductor.org/packages/3.15/${_pkgname}"
license=('MIT')
depends=(
  r
  r-assertthat
  r-biobase
  r-entropy
  r-msnbase
  r-mzr
  r-rcolorbrewer
  r-scales
)
optdepends=(
  r-covr
  r-devtools
  r-knitr
  r-mtbls2
  r-rmarkdown
  r-testthat
)
makedepends=(
  git
)
source=("git+https://git.bioconductor.org/packages/${_pkgname}")
sha256sums=('SKIP')

build() {
  rm -rf .git
  tar -zcvf ${_pkgname}_${_pkgver}.tar.gz  ${_pkgname}
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
