# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=plyinteractions
_pkgver=1.2.0
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
md5sums=('096a42786083c5af594646d3102dbc04')
b2sums=('c82591f8f1b21322eb8d296e25792cb478747977eb9fc319854a67df7176ae01405acce71cb40b6d588d6b5fcd488e39dd7f34fd971e15275edb2189309a0b54')

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
