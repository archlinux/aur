# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=nipalsMCIA
_pkgver=1.4.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Multiple Co-Inertia Analysis via the NIPALS Method"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-complexheatmap
  r-dplyr
  r-fgsea
  r-ggplot2
  r-multiassayexperiment
  r-pracma
  r-rlang
  r-rspectra
  r-scales
  r-summarizedexperiment
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocfilecache
  r-biocstyle
  r-circlize
  r-ggpubr
  r-knitr
  r-piggyback
  r-reshape2
  r-rmarkdown
  r-seurat
  r-spatstat.explore
  r-stringr
  r-testthat
  r-tidyverse
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4a691a9384ecc41d9f961478de1a45b6')
b2sums=('d3b64bd603afd3f171eefca9b461df683622593770c03af4faf0b5f7669d3edbe6103a87dc70cd28802df68c6fbdcd2e22f72a0557027987671b48c521441756')

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
