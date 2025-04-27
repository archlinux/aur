# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=katdetectr
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Detection, Characterization and Visualization of Kataegis in Sequencing Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biobase
  r-biocparallel
  r-bsgenome
  r-bsgenome.hsapiens.ucsc.hg19
  r-bsgenome.hsapiens.ucsc.hg38
  r-changepoint
  r-changepoint.np
  r-checkmate
  r-dplyr
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-ggtext
  r-iranges
  r-maftools
  r-plyranges
  r-rdpack
  r-rlang
  r-s4vectors
  r-scales
  r-tibble
  r-tidyr
  r-variantannotation
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('338c2b7abaf09d505238105406337eac')
b2sums=('0e6391f39a19bc518d038f56d3b0eb716b14900984da3b5baf49185c20bae194c9537d5827468737dcf4826ec901c89745c468c4e4cd1e3b0d9bacbf19d23eda')

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
