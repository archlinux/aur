#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspProcess
_pkgver=0.19.2
pkgname=r-${_pkgname,,}
pkgver=0.19.2
pkgrel=1
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
sha256sums=('5b49252dde820f75d9b7144828e81b7c6ddbbdad5771a04e73ce3db319332b64')


build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
