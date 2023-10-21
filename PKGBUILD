# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MSA2dist
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="MSA2dist calculates pairwise distances between all sequences of a DNAStringSet or a AAStringSet using a custom score matrix and conducts codon based analysis"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
depends=(
  r-ape
  r-biostrings
  r-doparallel
  r-dplyr
  r-foreach
  r-genomicranges
  r-iranges
  r-rcpp
  r-rlang
  r-seqinr
  r-stringi
  r-stringr
  r-tibble
  r-tidyr
)
makedepends=(
  r-rcppthread
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-devtools
  r-ggplot2
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('69cf471088b61e2f4ce253992ace214a')
sha256sums=('b2b9f16739172d99e9a90e379716cd5ad9a4e286059557ac8e0ea64cdfbfdad8')

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
