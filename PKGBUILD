# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MSA2dist
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="MSA2dist calculates pairwise distances between all sequences of a DNAStringSet or a AAStringSet using a custom score matrix and conducts codon based analysis"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
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
md5sums=('8a0d1c303af72c93a1810488010c2e6f')
b2sums=('158153791f951596afa798d2892d6c0f14c15e1afd230129cd4593f6a6ba17ba492ec06e84fe12fec56f3d85c649bad3b0a7cd45d4f37d5853420e37fbced8ac')

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
