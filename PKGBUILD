# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DAPAR
_pkgver=1.36.0
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
md5sums=('036ffb5bb1bdbb3a845e72d65ba22d3c')
b2sums=('3ca2d6f2092a8b2d8e19e6d18d931b741e31797e7bb6010df452e54fbe2ba7ccbf2b0345565b2055e2b21fca597d446b49218157558ddf0766bae73bbf44dcd1')

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
