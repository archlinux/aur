#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspProcess
_pkgver=0.18.2
pkgname=r-${_pkgname,,}
pkgver=0.18.2
pkgrel=4
pkgdesc="Process Module required by JASP"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL')
depends=(
  r
  r-dagitty
  r-ggplot2
  r-ggraph
  r-jaspbase
  r-jaspgraphs
)
groups=(r-jasp r-jaspextra)
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('2f95029ba480efa86aa97cbac941c5c98b54ce3baad782b87dbe3a89e9b9fa37')


build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
