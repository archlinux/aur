#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspCircular
_pkgver=0.17.3
pkgname=r-${_pkgname,,}
pkgver=0.17.3
pkgrel=1
pkgdesc="CircularStatistics Module for JASP"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL')
depends=(r
  r-jaspbase
  r-jaspgraphs
  r-circular
  r-ggplot2
)
groups=(r-jasp r-jaspextra)
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('30e4a5ef7c4d0c8a4018e1bdc201d3d39282170ac792c500c2b441df28371c22')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
