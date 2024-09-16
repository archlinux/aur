#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspProcess
_pkgver=0.19.0
pkgname=r-${_pkgname,,}
pkgver=0.19.0
pkgrel=2
pkgdesc="Process Module required by JASP"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL')
depends=(
  r
  r-blavaan
  r-dagitty
  r-ggplot2
  r-ggraph
  r-jaspbase
  r-jaspgraphs
  r-jaspjags
  r-runjags
)
groups=(r-jasp r-jaspextra)
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('ad327a51fe22d3c1b58205671d61f5b04a7590a9a8dc3ab6c53873c5d8f11093')


build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
