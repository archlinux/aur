#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspBain
_pkgver=0.17.0
pkgname=r-${_pkgname,,}
pkgver=0.17.0
pkgrel=7
pkgdesc="Bain Module for JASP"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL3')
depends=(r
  r-bain
  r-stats
  r-lavaan
  r-ggplot2
  r-semplot
  r-stringr
  r-jaspbase
  r-jaspgraphs
  r-jaspsem
)
groups=(r-jasp r-jaspextra)
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('8f8c7529ccf89b9e901f176c14136aa11434998986f68d0f06f15c081b29b4b3')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
