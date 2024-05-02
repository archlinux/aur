# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=plasmut
_pkgver=1.2.0
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
md5sums=('179aaa5defb862f1ddd0dd7c2c401634')
b2sums=('701903ce097cac4063d24b9ecb6800ed4539a466347807a108f3734b088c66d7324d37bb36a46641e0f452bc58fbe9a960901c9d42291033c0af04919ee61a7b')

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
