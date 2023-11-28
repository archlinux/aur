# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=plasmut
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Stratifying mutations observed in cell-free DNA and white blood cells as germline, hematopoietic, or somatic"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
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
md5sums=('8681d905157c0cbb8b46e48cbe4ecde9')
sha256sums=('306cec1a35232cf05ed7c3d5b2e0aabbd4393347003c1dd4502d5f95e3f447ac')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
