#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspVisualModeling
_pkgver=0.18.2
pkgname=r-${_pkgname,,}
pkgver=0.18.2
pkgrel=1
pkgdesc="Visual Modeling Module for JASP"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL')
depends=(r
  r-flexplot
  r-jaspbase
  r-jaspgraphs
)
groups=(r-jasp r-jaspextra)
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('68af6ef51e54671e600f92b5b83c5e37c2cfe4680d3348596e4e5d00fc3e8499')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
