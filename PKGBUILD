# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CytoPipeline
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Automation and visualization of flow cytometry data analysis pipelines"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocfilecache
  r-biocparallel
  r-diagram
  r-flowai
  r-flowcore
  r-ggcyto
  r-ggplot2
  r-jsonlite
  r-peacoqc
  r-rlang
  r-scales
  r-withr
)
checkdepends=(
  r-testthat
  r-vdiffr
)
optdepends=(
  r-biocstyle
  r-diffviewer
  r-dplyr
  r-knitr
  r-reshape2
  r-rmarkdown
  r-testthat
  r-vdiffr
  r-cytopipelinegui
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d2c0f4b250edcbcda7809920fc46b900')
b2sums=('edfc50a2816ef52706fc7a0b4bf5a9d4d9a7cd59241a39597abde849f0a071784f2e2057b0a9f75f84d0ed4d53815c7ca58af462107d461e7420a38a058cc517')

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
