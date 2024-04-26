# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scifer
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
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
md5sums=('82fb184bec0c09d5f7067baf81f8fee1')
b2sums=('f1639e305ad06eba8c97912b0b600b98f64f0e6bf0d74078f67432a53f061635ace877bb854733d5773231b19ee73a6b7521172d7291ae5a16de86e0c9d727ae')

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
