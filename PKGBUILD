# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=metabinR
_pkgver=2.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Abundance and Compositional Based Binning of Metagenomes"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-checkmate
  r-cli
  r-rjava
  r-s4vectors
  r-shortread
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-covr
  r-cvms
  r-data.table
  r-dplyr
  r-ggplot2
  r-gridextra
  r-knitr
  r-r.utils
  r-rmarkdown
  r-sabre
  r-spelling
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0e04c1dd0ec3a6beee43149f0ae51f14')
b2sums=('c9beb14ee7d4d055ca0130669dc9e9bb6b988eb97a3b18d4deb3934eaff0c043a007dc020e0cfcba872cbfff2a6d1862febfbfee66ec581dd711c8b56197c4db')

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
