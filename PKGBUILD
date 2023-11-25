# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=GNOSIS
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Genomics explorer using statistical and survival analysis in R"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(MIT)
depends=(
  r-car
  r-cbioportaldata
  r-comparegroups
  r-dashboardthemes
  r-desctools
  r-dt
  r-fabricatr
  r-fontawesome
  r-maftools
  r-magrittr
  r-operator.tools
  r-partykit
  r-rcolorbrewer
  r-reshape2
  r-rstatix
  r-shiny
  r-shinycssloaders
  r-shinydashboard
  r-shinydashboardplus
  r-shinyjs
  r-shinylogs
  r-shinymeta
  r-shinywidgets
  r-survminer
  r-tidyverse
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e3cbf07a76da1ae0aa6e669bad2cb778')
sha256sums=('ae75596cfc64be63f8c782b447c35bd8d1977c646374c861a4e32d65ff8c6037')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
