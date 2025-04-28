# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=plyinteractions
_pkgver=1.6.0
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
md5sums=('2b717f95be19fe69ba157a7030c94729')
b2sums=('2796ede79888f3081d437602afc7417d65e8527f7ae6c24a052529f072ed59c738086d0d94831e66347512166fd5529410edff75ce84a1cc52a53bcd5372d02d')

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
