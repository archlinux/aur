# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=plyinteractions
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('e072613b18768f43d832eaa32354bbc9')
b2sums=('e926a8959c1801f3b303e7cf19d4226f43fbc4ac5667fe46d0dc20a0fe2a2d555103cda51723c5b98284c4b713cbf721ee5620c970a85b54290a26c46ef12bd4')

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
