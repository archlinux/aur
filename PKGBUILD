#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspFrequencies
_pkgver=0.17.1
pkgname=r-${_pkgname,,}
pkgver=0.17.1
pkgrel=1
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
sha256sums=('6f772777208a89735c5eba0d3b18ee7b65425e94d8cf748fc6493495b671f00b')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
