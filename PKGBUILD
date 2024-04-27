# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=iSEEpathways
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('52b84dcbd5e5ab0a6bbdc27120d7e86a')
b2sums=('071a66ceef497d2e82e39fe0c1a20b16324137d1563b80111f5b368168d308943e31fd9909192eb08cf76593ec6708c949c2a3c23ec5f1502aea212a49ae2547')

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
