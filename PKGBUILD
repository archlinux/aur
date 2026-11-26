# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CytoPipeline
_pkgver=1.14.0
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
md5sums=('811575b9be5709af8d86831e41d10f19')
b2sums=('6dd241e269fcc29b99b01bf1b97fedbf44709ef1fb6c790c6411d1bb34d8ef6e17ac845b64a6e4a34dc3eac208761d617952a30d264a577e6421d10573be9da2')

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
