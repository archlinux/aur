#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspMixedModels
_pkgver=0.18.3
pkgname=r-${_pkgname,,}
pkgver=0.18.3
pkgrel=1
pkgdesc="Mixed Models Module for JASP"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL')
depends=(r
  r-afex
  r-emmeans
  r-ggplot2
  r-ggpol
  r-jaspbase
  r-jaspgraphs
  r-lme4
  r-loo
  r-mgcv
  r-rstan
  r-rstanarm
  r-stanova
)
groups=(r-jasp r-jaspcommon)
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('d122555462cd7488ad435a4ffb396cc15928a61098e7efe37092ef003a8f2110')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
