#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspFrequencies
_pkgver=0.17.0
pkgname=r-${_pkgname,,}
pkgver=0.17.0
pkgrel=6
pkgdesc="Frequencies Module for JASP"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL')
depends=(r
  r-abtest
  r-bayesfactor
  r-conting
  r-ggplot2
  r-jaspbase
  r-jaspgraphs
  r-plyr
  r-stringr
  r-vcd
  r-vcdextra
)
groups=(r-jasp r-jaspcommon)
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('ef81955c2d30b8fcfd8d7db15d33bafdc44619696e2afa062cb997e778fadd74')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
