#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspDescriptives
_pkgver=0.18.3
pkgname=r-${_pkgname,,}
pkgver=0.18.3
pkgrel=1
pkgdesc="Descriptives Module for JASP"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL')
depends=(r
'r-ggplot2'
'r-ggrepel'
'r-stringr'
'r-jaspbase'
'r-jaspgraphs'
)
groups=(r-jasp r-jaspcommon)
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('1d7ff39d4acd51819d985b43cd917b401466c003e0eafe6204b6b355cb057571')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
