# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MsDataHub
_pkgver=1.12.0
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
md5sums=('2c14bec070867e66379cd8112f526548')
b2sums=('1ee65a01783a480ffaa2d163f48daf114362d259fa9ae9a787e9eb6267b20cd9ec71b2bd923470e41db3357eed24c9849abe43c12b9bcebb862cea5c835ae6f7')

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
