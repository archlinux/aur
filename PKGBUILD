#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspPower
_pkgver=0.17.2
pkgname=r-${_pkgname,,}
pkgver=0.17.2
pkgrel=1
pkgdesc="Power Module for JASP"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL')
depends=(
  r
  r-pwr
  r-jaspbase
  r-jaspgraphs
)
groups=(r-jasp r-jaspextra)
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('6c4ad281639691e5f232730f61795f76631a81400b1ada56068f38cc98747fe4')


build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
