#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspGraphs
_pkgver=0.17.1
pkgname=r-${_pkgname,,}
pkgver=0.17.1
pkgrel=1
pkgdesc="Custom Graphs for JASP"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL')
depends=(r
'r-jsonlite'
'r-lifecycle'
'r-ggplot2'
'r-gridextra'
'r-rlang'
'r-scales'
'r-viridislite'
'r-rcolorbrewer'
)
groups=(r-jasp r-jaspbase)
optdepends=('r-testthat')
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('7544892f720ecc6879fb2ceb3da88ab3beb889f4be31530f930580a94febd416')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  # we may or may not need this link.
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
