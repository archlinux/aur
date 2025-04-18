# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MSA2dist
_pkgver=1.12.0
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
md5sums=('81bff32406ab7a7e31705f758aa17589')
b2sums=('8aa77dcca6264a987fe9da6ec60f614dc9ff299201aa3f04c713512389cd3f6da398a52bceee273f2c920d3e77c5586d2603a7bcab175173292700c2e579ebff')

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
