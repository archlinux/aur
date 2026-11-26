# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SparseArray
_pkgver=1.13.5
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
md5sums=('e8a059714ca678c203e4418424b563e7')
b2sums=('28fbd6865dbf07f288c69c938acff2115806a57529de6e6bf177a3b7777d7933257fc9e9e77a64e9ef8c5ea88f9b917dd0f2eb906443ed4d3c6cae51ea1f9f0d')

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
