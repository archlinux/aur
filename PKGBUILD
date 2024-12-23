#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspCochrane
_pkgver=0.19.2
pkgname=r-${_pkgname,,}
pkgver=0.19.2
pkgrel=1
pkgdesc="Cochrane Module for JASP"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL')
depends=(r
  r-jaspbase
  r-jaspgraphs
  r-jaspdescriptives
  r-jaspmetaanalysis
)
groups=(r-jasp r-jaspextra)
optdepends=('r-testthat')
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('4680d3ab666adc313ed833e63a34bfdfc7fd30c9060ca38635822d36a221045c')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
