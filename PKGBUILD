#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspTTests
_pkgver=0.18.2
pkgname=r-${_pkgname,,}
pkgver=0.18.2
pkgrel=1
pkgdesc="T-Tests Module for JASP"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL')
depends=(r
  r-bayesfactor
  r-car
  r-ggplot2
  r-jaspbase
  r-jaspgraphs
  r-logspline
  r-plotrix
  r-plyr
)
groups=(r-jasp r-jaspcommon)
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('94601becb462a6e8c5c56c08b60f8c96e0a17db855f9096071d821f298d61ff2')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
