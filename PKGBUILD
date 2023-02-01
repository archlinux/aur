#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspVisualModeling
_pkgver=0.17.0
pkgname=r-${_pkgname,,}
pkgver=0.17.0
pkgrel=6
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
sha256sums=('13588857ae839e3726bd8b08859cb7f6f2906bb38ace7786cf3269dfa94b913a')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
