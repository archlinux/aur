# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=cards
_pkgver=0.2.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Analysis Results Data"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('Apache-2.0')
depends=(
  r-cli
  r-dplyr
  r-glue
  r-rlang
  r-tidyr
  r-tidyselect
)
checkdepends=(
  r-hms
  r-testthat
)
optdepends=(
  r-spelling
  r-testthat
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('80e679b882cef4933f67e3921d8f0ce5')
b2sums=('0c390b5e459f9c006ab64be4f8bd8177cfcbcf8a0afbddbc1b2a96b9bcbe985e116b744043607907ed2c51efbb55aae51febd3c151fe5cdb837ddeae972ea844')

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
