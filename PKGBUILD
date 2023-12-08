# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CompoundDb
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Creating and Using (Chemical) Compound Annotation Databases"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
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
md5sums=('7863bdbb64d2068c22225ece8ed5844c')
sha256sums=('a3bc52352f715319129225eefbb2581ba1426a7ec8c057582a276a983b0f70b9')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
