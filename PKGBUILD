#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspBase
_pkgver=0.18.0
pkgname=r-${_pkgname,,}
pkgver=0.18.0
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
"jaspColumnEncoder-${_pkgver}.tar.gz::https://github.com/jasp-stats/jaspColumnEncoder/archive/refs/tags/v${_pkgver}.tar.gz"
)
sha256sums=('04310efd1cb8869672a43729fb7791cb045851777a36067bcd11218a890e9269'
            'da345bb73e365bb345935fd7263575ef0be1af79490105713cca06de258096ad')

build() {
  export INCLUDE_DIR=${srcdir}/jaspColumnEncoder-${_pkgver}

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  # we may or may not need this link.
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
