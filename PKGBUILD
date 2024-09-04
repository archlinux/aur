# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=TENxIO
_pkgver=1.6.1
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
md5sums=('fe8c1b7086ea979f3cc31c8940c92cbc')
b2sums=('14f00e54b0429a3b8fb9139b49a2fcae939c08fb9b2fec980b03f74e4bf8215a85de54c23b9e821329d1e369c8ffa373fbc2d704ffb91cb3e431ddc3f8c464e7')

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
