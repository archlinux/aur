# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CellBarcode
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Cellular DNA Barcode Analysis toolkit"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(MIT)
depends=(
  r-biostrings
  r-ckmeans.1d.dp
  r-data.table
  r-egg
  r-ggplot2
  r-magrittr
  r-plyr
  r-rcpp
  r-s4vectors
  r-seqinr
  r-shortread
  r-stringr
  r-zlibbioc
)
makedepends=(
  r-bh
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7b1eac1414aa90b4f31efa4acfbed68a')
sha256sums=('ced1963d99c0e703e8f31affba515c97cf16e69ee4cb93eb1e6842fd961fd769')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
