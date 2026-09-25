# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SpotClean
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="SpotClean adjusts for spot swapping in spatial transcriptomics data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-dplyr
  r-ggplot2
  r-rcolorbrewer
  r-readbitmap
  r-rhdf5
  r-rjson
  r-rlang
  r-s4vectors
  r-seurat
  r-spatialexperiment
  r-summarizedexperiment
  r-tibble
  r-viridis
)
checkdepends=(
  r-r.utils
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-r.utils
  r-rmarkdown
  r-spelling
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('aaf6ac019202d5b038da85fe24285b12')
b2sums=('6911345b5164da294edc628da5211cd921a61b4ce4923af5dfe95826aff14a940fbb46b053575d79d5cfe23f42a84abc3960b7df4c79115b35ef2a6ccd075ba5')

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
