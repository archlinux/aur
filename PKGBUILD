# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=iSEEindex
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="iSEE extension for a landing page to a custom collection of data sets"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
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
md5sums=('98a9141431a3206fd242b5b0b4056c41')
sha256sums=('2ddc239f24412bd695a254396c007da20143db112374f988cb0e0860bbb5e3e2')

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
