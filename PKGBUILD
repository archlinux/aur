# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=iSEEpathways
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="iSEE extension for panels related to pathway analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
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
md5sums=('c92fd9a45f30200db5072ec7a61b0e05')
b2sums=('6505178bc237f52f71f28a57c82f4cc2df7247b6b4ff48b3155993ac1bb6d87bca4d2a2456a1fabfcd27057953980f3cd4e6177fa376cac0e3710d2d544fae4f')

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
