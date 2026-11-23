# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CompoundDb
_pkgver=1.16.0
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
md5sums=('a82271539f1d2e0fce912869011f5d1a')
b2sums=('9968b94c83021503549551d519d073255c6f9add986aa0dedb107759df23b4a313c1a5c6fc9bf9c0a1b5bee0d9df4a682cb4ee18fff9c23fac6aafae409d14a7')

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
