# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=IFAA
_pkgver=1.14.1
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
md5sums=('63ce24cde288eaf73b15e843ad7bc13a')
b2sums=('d2b7836a234459e4ecfa62b6f24b8f4bae28588db6f52400924784757bc1752aaadaf8954306f82094408b23a911dd4e697d12c8d2d5a446f3b120eb7676764e')

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
