#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspTimeSeries
_pkgver=0.17.3
pkgname=r-${_pkgname,,}
pkgver=0.17.3
pkgrel=1
pkgdesc="A Time Series module for JASP"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL')
depends=(
  r
  r-forecast
  r-jaspbase
  r-jaspgraphs
)
groups=(r-jasp r-jaspextra)
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('2bdd76dbebb9b5dc9eac948885c3c1c5143c96e92ba9233844441c465fc0fefb')


build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
