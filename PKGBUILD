# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=TENxIO
_pkgver=1.6.0
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
  r-genomeinfodb
  r-genomicranges
  r-matrixgenerics
  r-r.utils
  r-rcurl
  r-readr
  r-s4vectors
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
  r-hdf5array
  r-knitr
  r-raggedexperiment
  r-rhdf5
  r-rmarkdown
  r-rsamtools
  r-tinytest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c057806cbd49aa1ef13d84a3650e2d1d')
b2sums=('aeb6ffc5bf986440aa0b9b5456b0c44fd4d80ba5a02d27816cdc5ab2a5afdead9e6934d31a972d4fb8a8afb112bd6db9c49f2d55495dd3391b61d43563a43318')

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
