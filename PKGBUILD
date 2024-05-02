# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=demuxmix
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Demultiplexing oligo-barcoded scRNA-seq data using regression mixture models"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-ggplot2
  r-gridextra
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-cowplot
  r-dropletutils
  r-knitr
  r-reshape2
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('09881e788c3d6b79b7be4e57b43787cd')
b2sums=('b6400e874374f7dab14c42fca607ce569d7883beeb855807eb7abea7d798f9635a8dfbf63c413ba2cef4ab84231e65e0a99ea3eb67df9dbad25dcd1f65b7bfc7')

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
