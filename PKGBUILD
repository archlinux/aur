#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspAcceptanceSampling
_pkgver=0.17.0
pkgname=r-${_pkgname,,}
pkgver=0.17.0
pkgrel=0
pkgdesc="Lot sampling for acceptance/rejection of lots"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL')
depends=(r
  r-abtest
  r-bayesfactor
  r-conting
  r-ggplot2
  r-jaspbase
  r-jaspgraphs
  r-plyr
  r-stringr
  r-vcd
  r-vcdextra
  r-acceptancesampling
)
groups=(r-jasp r-jaspextra)
makedepends=('git')
optdepends=()
source=("git+https://github.com/jasp-stats/${_pkgname}.git#commit=d70e1793b")
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
