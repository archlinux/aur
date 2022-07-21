# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rversions
_pkgver=2.1.1
pkgname=r-${_pkgname,,}
pkgver=2.1.1
pkgrel=4
pkgdesc="Query 'R' Versions, Including 'r-release' and 'r-oldrel'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-curl
  r-xml2
)
optdepends=(
  r-mockery
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('79aaacf5a1258d91ac0ddedf3c8c16a2d10d39010993dcc7b0a2638afee27cb1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
