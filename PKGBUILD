#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspBain
_pkgver=0.17.1
pkgname=r-${_pkgname,,}
pkgver=0.17.1
pkgrel=1
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
sha256sums=('808ffcf7b2b880922343f36c6ba159e677e1cb8e2842a7162f3d59b5e1594432')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
