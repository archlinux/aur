#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspBase
_pkgver=0.18.2
pkgname=r-${_pkgname,,}
pkgver=0.18.2
pkgrel=1
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
'r-jaspgraphs'
)
groups=(r-jasp r-jaspbase)
optdepends=()
source=(
"${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz"
"jaspColumnEncoder-${_pkgver}.tar.gz::https://github.com/jasp-stats/jaspColumnEncoder/archive/refs/tags/v0.18.0.tar.gz"
)
sha256sums=('fb5da4fd1bb42d3be4330ccd15e67a59e07640328d375f67636b0f6e65960f84'
            'da345bb73e365bb345935fd7263575ef0be1af79490105713cca06de258096ad')

build() {
  export INCLUDE_DIR=${srcdir}/jaspColumnEncoder-0.18.0

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  # we may or may not need this link.
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
