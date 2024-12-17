# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=nipalsMCIA
_pkgver=1.4.1
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
md5sums=('20f8a3f3c706485794d8763a13131554')
b2sums=('73bc586efe46a1ccaef73f2e1386790540e75d4619a7170ffa7ed04cd19c49da288b7a1709094c2688c4fe8c852f48320c157f7fa9884cf5d49bd445bad855d0')

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
