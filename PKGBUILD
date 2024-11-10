# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SpotClean
_pkgver=1.8.0
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
md5sums=('9bd3112138af8c8398a05bd0befe71d6')
b2sums=('3c6aaaf525df925b76fd0f797206952583c218d9a468b1b68bf4c2166fb8d1ad93c155746b5c11efccb2926973e02939db56caa4c0b4a31db79c50cf10e6c352')

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
