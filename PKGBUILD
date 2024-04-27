# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MobilityTransformR
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Effective mobility scale transformation of CE-MS(/MS) data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-metabocoreutils
  r-msnbase
  r-spectra
  r-xcms
)
checkdepends=(
  r-msdata
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-msdata
  r-rmarkdown
  r-roxygen2
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1d0f7904be49e25235092248b757df19')
b2sums=('f03d81fc313fd9259bc487efb47ff06cf8e5ad63348a6376cc3802c9434dd8c0b0db825e6776a5c6fdd52407b9766425a560d078d2d47e81d977058867c35195')

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
