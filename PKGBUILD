# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MSA2dist
_pkgver=1.16.0
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
md5sums=('310921e3474f7eb69d6ffefe38650eef')
b2sums=('e74feb86210bc21cd4e391b989f1d20139854f748c1851b6a706b7f0018904bd849c7f8f5aaa42bb285edd7781aa3b8428ca5a813ff42a2cc0b983623598b2f0')

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
