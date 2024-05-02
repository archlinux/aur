# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MsDataHub
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Mass Spectrometry Data on ExperimentHub"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-experimenthub
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-dt
  r-experimenthubdata
  r-knitr
  r-mzr
  r-psmatch
  r-qfeatures
  r-rmarkdown
  r-spectra
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('70c6eebcdeeb6474db9802057d0129ac')
b2sums=('ddbf3ec03458f5bda1d8f1f069c920bc453d5f0250803d1e3d70a1b398c2f9ca727e412fc44f7a162999d5080d0cd0ab955291f14bda8d40ec1fae6843ebda54')

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
