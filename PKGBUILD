# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=TEKRABber
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An R package estimates the correlations of orthologs and transposable elements between two species"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-3.0-or-later')
depends=(
  r-apeglm
  r-biomart
  r-deseq2
  r-doparallel
  r-dplyr
  r-foreach
  r-genomeinfodb
  r-magrittr
  r-rcpp
  r-rtracklayer
  r-scbn
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-bslib
  r-ggplot2
  r-ggpubr
  r-knitr
  r-plotly
  r-rmarkdown
  r-shiny
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('dd4cbed61611d47a14359019eb5fda18')
b2sums=('1e8095ee3ec26ccf179c63f1e4e49ac171fe348bec3ac0ed369c832acc56d5cee4bfbc14a258f218c8cdf5192c88ca47399f8caa5460dd13654fd17141b3cae8')

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
