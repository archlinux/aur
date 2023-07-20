#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspBase
_pkgver=0.17.3
pkgname=r-${_pkgname,,}
pkgver=0.17.3
pkgrel=2
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
makedepends=('git')
optdepends=()
source=(
"${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz"
"jaspColumnEncoder::git+https://github.com/jasp-stats/jaspColumnEncoder.git#commit=c63c0203d7"
)
sha256sums=('fdf791a22c2c60ef3ed6335e8cba44ac8186b2d15de08eac6c616d191fa421d0'
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
