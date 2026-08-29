# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CytoPipeline
_pkgver=1.12.0
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
md5sums=('6f5314aa4c6b137afec77bdcb9caf13b')
b2sums=('b784a769563c65edde5b59764789f1d5868a684c8f942d4bc46c35c50262ec8bd7ba63fe550f9c29c455f0474fc2347a8596b70d57cf22eb2f0c5c80b3305195')

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
