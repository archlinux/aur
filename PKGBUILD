#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspTools
_pkgver=0.18.3
pkgname=r-${_pkgname,,}
pkgver=0.18.3
pkgrel=1
epoch=1
pkgdesc="Helps preview and debug JASP analyses"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL')
depends=(r
'r-jsonlite'
'r-pkgbuild'
'r-rjson'
'r-rvg'
'r-testthat'
'r-data.table'
'r-httr'
'r-lifecycle'
'r-pkgload'
'r-remotes'
'r-stringi'
'r-stringr'
'r-vdiffr'
'r-archive'
)
groups=(r-jasp jaspbase)
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('e1fc1f5d1823e7c1a4f71a47fb608bd036bbc3af024faa3015a3eafb19d62dda')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  # we may or may not need this link.
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
