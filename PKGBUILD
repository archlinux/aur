# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CompoundDb
_pkgver=1.8.0
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
md5sums=('c3dee935be7aa50c82f4d799a5b65f99')
b2sums=('1e422cd664795aa340ae590afe749efc90f0967db28e308bf9c44c9a980167c2f8e96a76af62d74d87ea5ca932b4d3146d36c94510064cde1b3a0af529590797')

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
