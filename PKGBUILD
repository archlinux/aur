#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspReliability
_pkgver=0.17.0
pkgname=r-${_pkgname,,}
pkgver=0.17.0
pkgrel=3
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
makedepends=('git')
optdepends=()
source=("git+https://github.com/jasp-stats/${_pkgname}.git#commit=665be1aa16")
sha256sums=('SKIP')


build() {
  tar -cvf ${srcdir}/${_pkgname}_${_pkgver}.tar.gz ${_pkgname}
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
