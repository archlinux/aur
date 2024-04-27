# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SpotClean
_pkgver=1.4.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('b6e7be89394d959837993f3fd385ad55')
b2sums=('e023942be4dd01960ce75326997e9eb2f160981fd1aba08778c34881a0352ce2e711a86e03f534bafcdce0357ccd1fb35414d04570cbf6443fc7a450cf99c4db')

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
