# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=TENxIO
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Import methods for 10X Genomics files"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
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
md5sums=('98a845f55877d89b82b9a153fe54a41f')
sha256sums=('beece47e217747bf8279d3665963df727e2b685c6912414dbd1f639b0ceb2185')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla tinytest.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
