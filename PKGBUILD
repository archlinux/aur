#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspSummaryStatistics
_pkgver=0.18.3
pkgname=r-${_pkgname,,}
pkgver=0.18.3
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
sha256sums=('05a9df16d5850e3f5979f2b3bf21440c820e5faf79abbf56cfd9574fedc4a031')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
