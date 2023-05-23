#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspReliability
_pkgver=0.17.2.1
pkgname=r-${_pkgname,,}
pkgver=0.17.2.1
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
sha256sums=('a07222e784af326a34521f754b54022f80434c1de64809594b21b32cf986ff29')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
