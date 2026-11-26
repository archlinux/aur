# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CompoundDb
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Creating and Using (Chemical) Compound Annotation Databases"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationfilter
  r-biobase
  r-biocgenerics
  r-biocparallel
  r-chemminer
  r-data.table
  r-dbi
  r-dbplyr
  r-dplyr
  r-iranges
  r-jsonlite
  r-metabocoreutils
  r-mscoreutils
  r-protgenerics
  r-rsqlite
  r-s4vectors
  r-spectra
  r-stringi
  r-tibble
  r-xml2
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-msbackendmgf
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('12e1fb8959cee99ef347568688626fa2')
b2sums=('6c59c9282b71d6d2b510befbcde84aab14cd2193fa7c29b164fef2a4cdf963c094668881226ecb804be0a5e872d1c221e16b263fb6b013b062e4745fbc0b9147')

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
