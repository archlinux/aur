# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=IFAA
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Robust Inference for Absolute Abundance in Microbiome Analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-desctools
  r-doparallel
  r-dorng
  r-foreach
  r-glmnet
  r-hdci
  r-mathjaxr
  r-matrixextra
  r-parallelly
  r-s4vectors
  r-stringr
  r-summarizedexperiment
)
checkdepends=(
  r-biocgenerics
  r-runit
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('07318576d607d417c69569db3f70403b')
b2sums=('3bf5d94b66628f59bc923d4b5777c58671ef74fd3848e51c19ccfa805a176b6f23a0b8ae62b76076117012bff661179a32c3ed7c259a9c0c118989444acc1d84')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla runTests.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
