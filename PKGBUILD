#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspSummaryStatistics
_pkgver=0.18.2
pkgname=r-${_pkgname,,}
pkgver=0.18.2
pkgrel=1
pkgdesc="Summary Statistics Module for JASP"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL')
depends=(r
  r-bayesfactor
  r-bstats
  r-jaspbase
  r-jaspfrequencies
  r-jaspgraphs
  r-jaspregression
  r-jaspttests
  r-jaspanova
  r-jaspdescriptives
  r-suppdists
  r-bayesplay
)
groups=(r-jasp r-jaspextra)
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('f2f294d7107fac0ff046c82a84ee5b285c078662d1256a4610de41eb28cb071d')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
