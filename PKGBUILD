# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=TENxIO
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('98a845f55877d89b82b9a153fe54a41f')
b2sums=('2d80d62023d6673306c8d5308e19fea33668bd7943116aae322030b1e9f4f19b3c523a1b27dab702a7549687cc8c8100d3b2decda8b5ce65c4164d886271fa41')

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
