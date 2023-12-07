# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=biodbNcbi
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="biodbNcbi, a library for connecting to NCBI Databases."
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(AGPL3)
depends=(
  r-biodb
  r-chk
  r-r6
  r-xml
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-covr
  r-devtools
  r-knitr
  r-lgr
  r-rmarkdown
  r-roxygen2
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5d2c3e8eade431a86e13d54be468832e')
sha256sums=('859de0395db8acf97e2495cf269d7fece95054005ba3a3dcc69f1b19d0bc6ce2')

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
