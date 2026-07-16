# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=TENxIO
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Import methods for 10X Genomics files"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocbaseutils
  r-biocgenerics
  r-biocio
  r-genomicranges
  r-hdf5array
  r-matrixgenerics
  r-r.utils
  r-readr
  r-rhdf5
  r-s4vectors
  r-seqinfo
  r-singlecellexperiment
  r-summarizedexperiment
)
checkdepends=(
  r-hdf5array
  r-raggedexperiment
  r-rhdf5
  r-rsamtools
  r-tinytest
)
optdepends=(
  r-biocstyle
  r-droplettestfiles
  r-experimenthub
  r-knitr
  r-raggedexperiment
  r-rmarkdown
  r-rsamtools
  r-tinytest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7509a5d47964b7d40aa94fd85012e0db')
b2sums=('ecd83b4d23d85fbd4bfa397605b4d241e2b690bfe8c5bddf0e4c729bd21513b802d5ab807780fc86a6c01ef273e27b81d80d85c2255feba04490dfe3c5e55f5d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla tinytest.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
