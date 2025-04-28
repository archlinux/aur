# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=GNOSIS
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Genomics explorer using statistical and survival analysis in R"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
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
md5sums=('4be76b3bc8c342411ef7f8758540b5e2')
b2sums=('7f743302ce0cdde6b84401f12f77b6570d96fc2a348ec2986204896dab29b3b152dca5ee9ec18fc9eb3da6085c3a8b4bd59d7ce30743b0e658e3d9a58c95bb04')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
