#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspCircular
_pkgver=0.17.0
pkgname=r-${_pkgname,,}
pkgver=0.17.0
pkgrel=6
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
sha256sums=('653ba52e681ec0732a54985ee8e72656b225a1a55c5bfe1ee10636d1b21513a4')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
