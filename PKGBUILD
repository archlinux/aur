# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=quantiseqr
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('e0d20b87da16f9c0598bb446c55d0d39')
b2sums=('42aa192d79d281df4e0a57607ddb12edf00e463415ce41d22979e4d755c25013c55c52bc131714935644371858dd1365c480b05745daee87567236d6bbac7387')

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
