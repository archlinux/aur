# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=quantiseqr
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Quantification of the Tumor Immune contexture from RNA-seq data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biobase
  r-ggplot2
  r-limsolve
  r-preprocesscore
  r-rlang
  r-summarizedexperiment
  r-tidyr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-annotationdbi
  r-biocstyle
  r-dplyr
  r-experimenthub
  r-geoquery
  r-knitr
  r-macrophage
  r-org.hs.eg.db
  r-reshape2
  r-rmarkdown
  r-testthat
  r-tibble
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('34cd21d2e59e1f8f58001fdcc49eaf44')
b2sums=('f3a1f20f64ce475cbfa3a0a5d9f1fd9a058e189b06318a5a80acf3ed9bcf4b05b67f2bbf4f16af84e1af190d915f23ef0db2a6e564c33cc28cc05f3ca1485be1')

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
