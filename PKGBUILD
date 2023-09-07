#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspJags
_pkgver=0.18.0
pkgname=r-${_pkgname,,}
pkgver=0.18.0
pkgrel=1
pkgdesc="JAGS Module for JASP"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL')
depends=(r
  r-coda
  r-ggplot2
  r-ggtext
  r-hexbin
  r-jaspbase
  r-jaspgraphs
  r-rjags
  r-stringr
)
groups=(r-jasp r-jaspextra)
optdepends=()
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('4028d9a1d8ceccece619294ba7cc5bb4c80bee82c3d92f5305d4863b5db8471a')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
