# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=iSEEhub
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="iSEE for the Bioconductor ExperimentHub"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
depends=(
  r-annotationhub
  r-biocmanager
  r-dt
  r-experimenthub
  r-isee
  r-rintrojs
  r-s4vectors
  r-shiny
  r-shinydashboard
  r-shinyjs
  r-singlecellexperiment
  r-summarizedexperiment
)
checkdepends=(
  r-nullrangesdata
  r-testthat
)
optdepends=(
  r-biocstyle
  r-covr
  r-knitr
  r-nullrangesdata
  r-refmanager
  r-rmarkdown
  r-sessioninfo
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6ebb32da66242f608b83522fca1d9a62')
sha256sums=('fcdfb6869261ce9571414904286a4b46f4a0be6df3770c75d7a22dd9d84e0899')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
