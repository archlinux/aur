# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=plasmut
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Stratifying mutations observed in cell-free DNA and white blood cells as germline, hematopoietic, or somatic"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-dplyr
  r-tibble
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-biocviews
  r-ggrepel
  r-knitr
  r-magrittr
  r-qpdf
  r-rmarkdown
  r-testthat
  r-tidyverse
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8a469bd9edd5f1a81ad97906d90d214f')
b2sums=('a8daa85974fcb7f08626b1f38a85b5ef07616ea6f3d00656538f7f1d1958db2edeb5cb74245375051deb83e1ab04c1b68aa08adf6a8316a0065e990fe5f62a78')

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
