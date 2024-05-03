# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=iSEEindex
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="iSEE extension for a landing page to a custom collection of data sets"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocfilecache
  r-dt
  r-isee
  r-paws.storage
  r-rintrojs
  r-shiny
  r-shinydashboard
  r-shinyjs
  r-singlecellexperiment
  r-stringr
  r-summarizedexperiment
  r-urltools
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-covr
  r-knitr
  r-refmanager
  r-rmarkdown
  r-sessioninfo
  r-testthat
  r-yaml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5ec09044fa2963f40e87f633425ea355')
b2sums=('6dad5b2d664e208863eb0ff34084e88d26ebca65a4ca90fb07590d2f2d4043b144f71b06fa91455e2f3751f3cee93702c333586bc568ae3b6a1463cb07710ebf')

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
