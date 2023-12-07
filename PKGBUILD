# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=biodbExpasy
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="biodbExpasy, a library for connecting to Expasy ENZYME database."
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(AGPL3)
depends=(
  r-biodb
  r-chk
  r-r6
  r-stringr
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
md5sums=('b4c2596f2efc76e3ba7cba00fb3a6177')
sha256sums=('c1d30717bb6389db733bfe0416600da97b8441acd52bc338eb9ce5387c0c0ef9')

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
