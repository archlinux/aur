# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=iSEEpathways
_pkgver=1.2.0
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
md5sums=('7860667a97211f49ac4225f708fbe067')
b2sums=('48c1c984d1765ef33b8a60c023a858efbe39ad74a2acfc6df940c27ee5821f348ac7c78f50e660b355d119e2016e09fad25b7a883fa1a678e5f6d11dd5fcae4c')

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
