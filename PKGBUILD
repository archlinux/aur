# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SparseArray
_pkgver=1.10.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="High-performance sparse data representation and manipulation in R"
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
  r-experimenthub
  r-hdf5array
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6af77d1310742355aaa947b221cd7add')
b2sums=('551386f8eb4bd5b507212caca51fbe01af67966d268edcf55d4cd7f68585dcd0fa63ec7fd3d19d88e554083d515d1cb33e33e40c43b944b7c25f525012d999a0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

#check() {
#  cd "$_pkgname/tests"
#  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
#}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
