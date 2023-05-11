#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspReliability
_pkgver=0.17.2
pkgname=r-${_pkgname,,}
pkgver=0.17.2
pkgrel=1
pkgdesc="Reliability Module for JASP"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL')
depends=(r
  r-bayesrel
  r-coda
  r-ggplot2
  r-ggridges
  r-jaspbase
  r-jaspgraphs
  r-laplacesdemon
  r-mass
  r-psych
  r-lme4
  r-irr
)
groups=(r-jasp r-jaspextra)
optdepends=()
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('a0a35d2e9c47a64042284b2ea48ff6f62e29a410dc87d699fca159409a5233ff')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
