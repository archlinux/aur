# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SparseArray
_pkgver=1.2.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Efficient in-memory representation of multidimensional sparse arrays"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
depends=(
  r-biocgenerics
  r-iranges
  r-matrixgenerics
  r-matrixstats
  r-s4arrays
  r-s4vectors
  r-xvector
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-delayedarray
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a73b2e316ce8135de81af01a9a9610ec')
sha256sums=('372134d465e554124f55c6c74955a5ac3e1b8c094e2194e9058c5de6c51e5ace')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
