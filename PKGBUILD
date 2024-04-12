# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=metabinR
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Abundance and Compositional Based Binning of Metagenomes"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-rjava
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-cvms
  r-data.table
  r-dplyr
  r-ggplot2
  r-gridextra
  r-knitr
  r-r.utils
  r-rmarkdown
  r-sabre
  r-spelling
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7080ae8eac49640aeae95bda1185ac7d')
b2sums=('aca5dc5305cd8218c5fe4086629d46ad848d9e9a9836dac76e844ba20a2b77e891fb42f1604ec446dbe9cd27615869d7db75e93a9e12536647b0dc5b6dbd92eb')

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
