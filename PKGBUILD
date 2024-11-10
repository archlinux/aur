# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=plyinteractions
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Extending tidy verbs to genomic interactions"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocgenerics
  r-dplyr
  r-genomeinfodb
  r-genomicranges
  r-interactionset
  r-iranges
  r-plyranges
  r-rlang
  r-s4vectors
  r-tibble
  r-tidyselect
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocparallel
  r-biocstyle
  r-biostrings
  r-bsgenome.mmusculus.ucsc.mm10
  r-covr
  r-hicontactsdata
  r-knitr
  r-refmanager
  r-rmarkdown
  r-rtracklayer
  r-scales
  r-sessioninfo
  r-testthat
  r-tidyverse
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1dd6aab852245e89ebc7e2b1df6fff25')
b2sums=('dc529b089ae778db2c117ea3a18cd86e75991f462c47aa4fdf4d1fc83edc0873667f7ec1a48a2c6a8cdbaa6d9b09980cf6727a0b076f53496d5280eedb1fc552')

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
