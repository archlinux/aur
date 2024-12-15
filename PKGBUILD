# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=HiCDOC
_pkgver=1.8.0
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
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-gridextra
  r-gtools
  r-interactionset
  r-multihiccompare
  r-pbapply
  r-rcpp
  r-s4vectors
  r-summarizedexperiment
  r-zlibbioc
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
md5sums=('d6f9e9565f7fd00b7cc8bc1689c2111d')
b2sums=('5b8de4eb4c53d40574ea78e804ef4b613291c0d2fbc4195635df4d8fdd7073ece13a0702d68c1da614a40b2292bd49aed61ca410381ee409d9f5f1d69b63a675')

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
