# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SparseArray
_pkgver=1.2.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Efficient in-memory representation of multidimensional sparse arrays"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
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
md5sums=('42ba66c3146b623250558daa44adf389')
b2sums=('a5e595e58e880d079a3ab5ec58537695cce2ae7cf8823f7ca1bb8a337be653d4d44bfaf546db1ab9185defb844abd761d003d5ce17616bcb0184d1a40b53211d')

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
