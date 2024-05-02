# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=seqArchR
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Identify Different Architectures of Sequence Elements"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  python-packaging
  python-scikit-learn
  r-biocparallel
  r-biostrings
  r-cli
  r-cvtools
  r-fpc
  r-ggplot2
  r-ggseqlogo
  r-matrixstats
  r-prettyunits
  r-reshape2
  r-reticulate
)
checkdepends=(
  r-testthat
  r-vdiffr
)
optdepends=(
  r-biocstyle
  r-covr
  r-cowplot
  r-hopach
  r-knitr
  r-rmarkdown
  r-testthat
  r-vdiffr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6d12e6fcb163cc682986160f06cc63c9')
b2sums=('d73cc31ed4c3c82bdf0d6ff6b9dd02365e3da339e8db2cabc5c782d20ef110e3ccd43805fc931f7ab38e1c3923168fc80186d61184c2fb3b39545c0ce550924f')

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
