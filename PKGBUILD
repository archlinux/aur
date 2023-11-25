# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=iSEEpathways
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="iSEE extension for panels related to pathway analysis"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
depends=(
  r-ggplot2
  r-isee
  r-s4vectors
  r-shiny
  r-shinywidgets
  r-summarizedexperiment
)
checkdepends=(
  r-fgsea
  r-testthat
)
optdepends=(
  r-airway
  r-biocstyle
  r-covr
  r-edger
  r-fgsea
  r-go.db
  r-iseede
  r-knitr
  r-org.hs.eg.db
  r-refmanager
  r-rmarkdown
  r-scater
  r-scuttle
  r-sessioninfo
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('52b84dcbd5e5ab0a6bbdc27120d7e86a')
sha256sums=('ee415ded9e44d0ef1eb82419063d80f71d722d1c069fcb010c17f57bc63b712b')

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
