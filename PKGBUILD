# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MsDataHub
_pkgver=1.6.0
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
md5sums=('315760cb18f34292e0349572be2492d3')
b2sums=('41a9f7b6633dbeea73397d3f5ec5d35f2878983263e6cfbf9ea28023e33a86eb24355af4bf0a8c3e5092d3d22ae3d6c0d5b1fa6a5526fc91cf14b16b3f9dd78e')

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
