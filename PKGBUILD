# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=IntOMICS
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Integrative analysis of multi-omics data to infer regulatory networks"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
depends=(
  r-bestnormalize
  r-bnlearn
  r-bnstruct
  r-cowplot
  r-ggplot2
  r-ggraph
  r-gplots
  r-igraph
  r-matrixstats
  r-numbers
  r-rcolorbrewer
  r-rlang
  r-summarizedexperiment
)
checkdepends=(
  r-multiassayexperiment
  r-testthat
)
optdepends=(
  r-biocstyle
  r-curatedtcgadata
  r-knitr
  r-rmarkdown
  r-tcgautils
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('61628ea37535123f71455b77b194b08c')
sha256sums=('f0e70d50c624b6092c81456dd2da3e2b37a6666f59a644e2d7e9aa8f2e8a16e2')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
