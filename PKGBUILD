# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=iSEEpathways
_pkgver=1.6.0
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
md5sums=('70332037d24dba5f6dc216ebcb965fd0')
b2sums=('82b3a5b681ff2d03288a1f8f6e1c8ee971d14dd33c6e1ea4e41135580eb88f5572e40cf6efd0babfeab1d382b79bb870c67d5f236fa2a6135cadbe9fae81f94a')

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
