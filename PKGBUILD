# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=metabinR
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Abundance and Compositional Based Binning of Metagenomes"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-rjava
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
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
md5sums=('d4e1bf7ff3769d94c6fc7dd9ec5dfdd6')
b2sums=('a538880b384495be8dec20b7496dde72311d8208d0a29a93d9fc205b91faa58726b4b5282ef531d70f1eb20cdaf886d7f9950da277a76bc08837d5a7eef3c60d')

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
