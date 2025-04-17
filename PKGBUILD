# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=plasmut
_pkgver=1.6.0
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
md5sums=('15f60aa1d4cf0d6745111ff1b1be4ee9')
b2sums=('96ba287764b833c30789415283ce3b7b4226690c51563c22bbb4422daeba62d0e9a4151649ce8466cf6d5317611457182672996ef08a4f1bcb0f075d81fd197f')

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
