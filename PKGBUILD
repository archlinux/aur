#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspAudit
_pkgver=0.17.2.1
pkgname=r-${_pkgname,,}
pkgver=0.17.2.1
pkgrel=1
pkgdesc="Audit Module for JASP"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL')
depends=(r
  r-bstats
  r-digittests
  r-extradistr
  r-ggplot2
  r-ggrepel
  r-jaspbase
  r-jaspgraphs
  r-jfa
)
groups=(r-jasp r-jaspextra)
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('8f6367153eb1152c2495b48aa952e3f8958ce3037c45eef1b3c0a9d559778f40')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
