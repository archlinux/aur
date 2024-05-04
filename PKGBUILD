# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=iSEEhub
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="iSEE for the Bioconductor ExperimentHub"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
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
md5sums=('1cbbed99cbea544913346ac52afcd594')
b2sums=('a0b4b990c6ab742aef986e3508363983c3376234048cf63c00bb757bb1340b293aa93920a15a04a6b97a16d41f428f1e36001e1e8b249fcd3ce69af98ed800b0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
