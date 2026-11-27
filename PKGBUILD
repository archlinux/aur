# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scifer
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Single-Cell Immunoglobulin Filtering of Sanger Sequences"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-basilisk
  r-basilisk.utils
  r-biostrings
  r-data.table
  r-decipher
  r-dplyr
  r-flowcore
  r-ggplot2
  r-gridextra
  r-here
  r-kableextra
  r-knitr
  r-plyr
  r-pwalign
  r-reticulate
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
  r-biocbaseutils
  r-biocstyle
  r-fs
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('15d153fe4f5ab6ff70a52eab1c946d2f')
b2sums=('d403f59aab661bd4a4c9c4f0996243b47ece164f3832fc350e23cc5803816deb01823596220f8bf5d4fd8cbba66751af3994198b5b11db31caf859ccaedd6d6a')

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
