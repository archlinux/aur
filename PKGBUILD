# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=IntOMICS
_pkgver=1.0.0
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
md5sums=('eec7530ce0fd9941c0cfe06c864e7511')
sha256sums=('370511a058607140956106269f754afc533bd869b6f9574833b5ba74f4defd80')

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
