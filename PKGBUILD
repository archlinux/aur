# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MsDataHub
_pkgver=1.8.0
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
md5sums=('bc522c7b8986bb2d26244bba320ed7bc')
b2sums=('bcf7e0d10fad725c94c3bc2a3bc5f4cd0734a4d738d7258a79a7f6830f103d39556b392fb600404bfc0cde662f447d178c1a0f73d0642d4d75d43676904f0c43')

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
