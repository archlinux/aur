#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspFrequencies
_pkgver=0.17.2
pkgname=r-${_pkgname,,}
pkgver=0.17.2
pkgrel=3
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
  r-multibridge
  r-plyr
  r-stringr
  r-vcd
  r-vcdextra
)
groups=(r-jasp r-jaspcommon)
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('b9fc6b0d621230e999703aeb495f67df4ca0909a20f5e7d32ed422896de425c7')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
