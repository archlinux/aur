# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scifer
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Single-Cell Immunoglobulin Filtering of Sanger Sequences"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-biostrings
  r-data.table
  r-decipher
  r-dplyr
  r-flowcore
  r-ggplot2
  r-gridextra
  r-kableextra
  r-knitr
  r-plyr
  r-rlang
  r-rmarkdown
  r-sangerseqr
  r-scales
  r-stringr
  r-tibble
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-fs
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('92ff7394e0644ff2533e941cd2bf52bd')
b2sums=('05b987ad730db1846feaceb81ceecabe447550b9245c7195439f8c86cd4d88f7ee3d83c971c5c3fa75de41a6446df5513808ed19f4070c1ed16c7f4b75c426b9')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
