# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=HiCDOC
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A/B compartment detection and differential analysis"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-3.0-only')
depends=(
  r-biocgenerics
  r-biocparallel
  r-cowplot
  r-data.table
  r-genomicranges
  r-ggplot2
  r-gridextra
  r-gtools
  r-interactionset
  r-multihiccompare
  r-pbapply
  r-rcpp
  r-s4vectors
  r-seqinfo
  r-summarizedexperiment
  zlib
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-knitr
  r-rhdf5
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3c72b372a788851f70865cfe4ee7d2da')
b2sums=('072ffd5ff20bfba95671b84c805796e6364578ca3919e221be1158c6005da055e7e25d3b93accc36a71444f864f6e71efcc764e7edea71d63c1284ec69087dd3')

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
