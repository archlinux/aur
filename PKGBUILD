# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MsBackendMsp
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Mass Spectrometry Data Backend for NIST msp Files"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocparallel
  r-iranges
  r-mscoreutils
  r-protgenerics
  r-s4vectors
  r-spectra
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-roxygen2
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('cd1d33e6c98c6cc2900a0e3dbf857275')
b2sums=('c6a70bcd2d3dbb0b3fd7d082450f4492587d9814558b5f0fee27bed05f46ea28136bc235448b690b11dde858fce8610249ebd7b60098b236c92a6bdf63fb0246')

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
