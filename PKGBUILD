# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DAPAR
_pkgver=1.38.0
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
md5sums=('dd51e0de294beab7baec943e13109940')
b2sums=('f7fc193bf3fd1ab8c3b4e7c6dafa680c1c6423c3fa13d01c31ef5cce246dcd82dab3572885742b164bf91792efeb1ff343d406522be0de00c115034fb883ced1')

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
