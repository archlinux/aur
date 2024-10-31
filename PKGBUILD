# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CompoundDb
_pkgver=1.10.0
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
md5sums=('c79d6a2cc057e9505a1016d679642870')
b2sums=('4d273a4481778213b3a4568e97e768d26063e48e845705574103fa0a3247e56c6b21de442984e58bbd5cecfc684ee63165af02ce0630c5e607889b77599ac44b')

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
