# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DAPAR
_pkgver=1.36.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tools for the Differential Analysis of Proteins Abundance with R"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
  r-dapardata
  r-foreach
  r-highcharter
  r-msnbase
)
checkdepends=(
  r-imp4p
  r-testthat
)
optdepends=(
  r-annotationdbi
  r-apcluster
  r-biocstyle
  r-clusterprofiler
  r-cp4p
  r-dendextend
  r-diptest
  r-doparallel
  r-dplyr
  r-factoextra
  r-factominer
  r-forcats
  r-ggplot2
  r-gplots
  r-graph
  r-igraph
  r-imp4p
  r-impute
  r-knitr
  r-limma
  r-lme4
  r-mfuzz
  r-multcomp
  r-norm
  r-openxlsx
  r-org.sc.sgd.db
  r-preprocesscore
  r-purrr
  r-rcolorbrewer
  r-readxl
  r-reshape2
  r-scales
  r-stringr
  r-testthat
  r-tibble
  r-tidyr
  r-tidyverse
  r-vioplot
  r-visnetwork
  r-vsn
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('de7a542a78ca7edc30619d0afc2c4782')
b2sums=('6efc40a27dbd0155ae9f922c9ad9361d1cd674d238e01e8966aa73c7569a814955ad91c3e329c3deb30f1712a58072afeef4fe463ea02818f0ebebf9d7f098a4')

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
