# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=metabinR
_pkgver=1.10.0
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
md5sums=('fdffc34e821e2d0496f332e0b7929dce')
b2sums=('9bc50ad167d1ebcf4b79da18deebbd4c55565e08f567ff1c9603741825673d0ad73dd9f42595a9c583aa1181967079aaf55893f3259ade0c0cbfe200b811695b')

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
