#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspGraphs
_pkgver=0.18.3
pkgname=r-${_pkgname,,}
pkgver=0.18.3
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
sha256sums=('3110108ce75b5a7c87ab35440284490d10eeeb5f70c27aa820c4c20a5a7abbed')


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
