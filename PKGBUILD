# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=IFAA
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Robust Inference for Absolute Abundance in Microbiome Analysis"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL2)
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
md5sums=('2fed85b602afd876a82a6f150f7edcc6')
sha256sums=('b35d7c37bb908bb3efaab5796eb45226c7bfca005260091fe324fb36153a7daf')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla runTests.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
