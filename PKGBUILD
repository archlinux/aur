# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=IntOMICS
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Integrative analysis of multi-omics data to infer regulatory networks"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
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
b2sums=('f77be18c5c62c54afeaa69c7d5b9fa909d60eaa241a3fc133a0d4300cfa2811ea9cdc740dbeabf3525ae602f44c3e4a4f4ef85f63732e315e5503e24a7b2c944')

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
