#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspCochrane
_pkgver=0.18.2
pkgname=r-${_pkgname,,}
pkgver=0.18.2
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
sha256sums=('dfd6b1bdafa7428926a0a0fd3c195214273b338fd17d1c044b1e4ba06aef3f7c')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
