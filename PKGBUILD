# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=nipalsMCIA
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('0558d05ea61523c6fcaed9d8ed9b0ded')
b2sums=('1b4f12364525b2732899e332a90c97b3ba68320a996442e94cf67c983c97e5ad98c2ce65f6e85b2bcc5410118a1f279514199dfd35b4432651094f5beafe8e91')

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
