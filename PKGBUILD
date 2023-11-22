# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DAPAR
_pkgver=1.34.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tools for the Differential Analysis of Proteins Abundance with R"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
depends=(
  r-annotationdbi
  r-apcluster
  r-biobase
  r-clusterprofiler
  r-cp4p
  r-dapardata
  r-dendextend
  r-diptest
  r-doparallel
  r-dplyr
  r-factoextra
  r-factominer
  r-forcats
  r-foreach
  r-ggplot2
  r-gplots
  r-graph
  r-highcharter
  r-igraph
  r-imp4p
  r-impute
  r-knitr
  r-limma
  r-lme4
  r-mfuzz
  r-msnbase
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
  r-tibble
  r-tidyr
  r-tidyverse
  r-vioplot
  r-visnetwork
  r-vsn
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('98c2672a3b694f6d1989cdd4f00cd8e0')
sha256sums=('c4913baf12a068824362c8f41c9372a437c8f2a80eb9a4bf557524593f894ddf')

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
