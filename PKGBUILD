# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DAPAR
_pkgver=1.40.0
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
md5sums=('31a0bf6abf2596aa3249584dc402f60e')
b2sums=('0f297217a8f307725205ea6315c204f41206ed668196d417c3b73bc3ac0a41342ce56685bdded9145c8be81334d55fa24a5325b2e7c4b5712d35b6ca6e518168')

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
