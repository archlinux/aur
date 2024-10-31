# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MSA2dist
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
  r-pwalign
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
md5sums=('a7b7b619a8a9eacfca84d05e1499b4dc')
b2sums=('af9490e668f63c199211da67389ee387bc46bbb3bd25db419355a36e7660f2732090bfba88f7995247bae4820dcb1f7c7ecfc1094e5315e800ffe36f89e265d4')

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
