#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspTTests
_pkgver=0.18.0
pkgname=r-${_pkgname,,}
pkgver=0.18.0
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
sha256sums=('83e17e01db990de601a71c0887c156f437250042335a4148125060383124e726')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
