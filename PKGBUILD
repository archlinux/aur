# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=plasmut
_pkgver=1.4.0
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
md5sums=('9708eb46f23bff31c138161f8d609237')
b2sums=('3b1a9dbb1f445994d60a27557b25cffd31fc6acaec4fb8ed9d30c349369c09bc8245e38a296f447f3c35c485db7a44b35d0403452e90afade4f8335d1dc43b50')

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
