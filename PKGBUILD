#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspBase
_pkgver=0.17.0
pkgname=r-${_pkgname,,}
pkgver=0.17.0
pkgrel=7
pkgdesc="Package contains the JASP Bayesian and Frequentist analyses."
arch=('x86_64' 'aarch64')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL')
depends=(r
'r-ggplot2'
'r-gridextra'
'r-gridgraphics'
'r-jsonlite'
'r-kknn'
'r-modules'
'r-officer'
'r-pkgbuild'
'r-plyr'
'r-qgraph'
'r-ragg'
'r-r6'
'r-renv'
'r-rjson'
'r-rvg'
'r-svglite'
'r-systemfonts'
'r-withr'
'r-testthat'
'r-data.table'
'r-httr'
'r-lifecycle'
'r-pkgload'
'r-remotes'
'r-stringi'
'r-stringr'
'r-vdiffr'
)
groups=(r-jasp r-jaspbase)
makedepends=('git')
optdepends=()
source=(
"${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz"
"jaspColumnEncoder::git+https://github.com/jasp-stats/jaspColumnEncoder.git#commit=c63c0203d7"
)
sha256sums=('64bfb3b45939833c74167562379c0fec4a127fbb5ca20b83860f94178c3c39a4'
            'SKIP')

build() {
  export INCLUDE_DIR=${srcdir}/jaspColumnEncoder

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  # we may or may not need this link.
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
