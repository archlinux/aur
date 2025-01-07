#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspLearnStats
_pkgver=0.19.3
pkgname=r-${_pkgname,,}
pkgver=0.19.3
pkgrel=1
pkgdesc="Learn Classical statistics with simple examples and supporting text"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL-2.0-or-later')
depends=(r
  r-extradistr
  r-ggplot2
  r-jaspbase
  r-jaspgraphs
  r-jaspdistributions
  r-jaspdescriptives
  r-jaspttests
  r-ggforce
  r-tidyr
  r-igraph
  r-hdinterval
  r-metafor
)
groups=(r-jasp r-jaspextra)
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('862d7a8a3d4622403aa64be1e71be2e48c6435369d4558353059339930f7f37b')

build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
