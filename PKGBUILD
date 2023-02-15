#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspProphet
_pkgver=0.17.1
pkgname=r-${_pkgname,,}
pkgver=0.17.1
pkgrel=1
pkgdesc="Prophet Module (Beta) for JASP"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL')
depends=(r
  r-ggplot2
  r-jaspbase
  r-jaspgraphs
  r-prophet
  r-scales
  r-rstan
)
groups=(r-jasp r-jaspextra)
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('5c7ea91f01bd8cc133055b1fbaa548039a30e41f3d98b202afcd6587b04e1e5c')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
