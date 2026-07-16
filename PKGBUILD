# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=plyinteractions
_pkgver=1.10.0
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
  r-genomicranges
  r-interactionset
  r-iranges
  r-plyranges
  r-rlang
  r-s4vectors
  r-seqinfo
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
  r-genomeinfodb
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
md5sums=('234654b3e83c4b6b4b96147a94379726')
b2sums=('9e19798be1dbb727daae7fdaa90ecdb1c9a2083005cbf6433c3c748b7c820a3df9f77500269e263c9e75f230d35b4b35f1355d0d2ce4554c5ac408ba4f291ea5')

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
