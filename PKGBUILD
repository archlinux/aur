# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=iSEEhub
_pkgver=1.16.0
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
md5sums=('54b660962102040bb74870d6d1beba66')
b2sums=('4fad7b8938eaa6842c158890fdd2fe801cfbe7b8efb25fd5e745117cf857cb7e03672d46d66fbfceb50ecdd841ff155cfd4d41c74bd6b9a77b6047d83ec671f0')

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
