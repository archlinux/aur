# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=mslp
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Predict synthetic lethal partners of tumour mutations"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-data.table
  r-dorng
  r-fmsb
  r-foreach
  r-magrittr
  r-org.hs.eg.db
  r-proc
  r-randomforest
  r-rankprod
)
checkdepends=(
  r-tinytest
)
optdepends=(
  r-biocstyle
  r-dofuture
  r-future
  r-knitr
  r-rmarkdown
  r-roxygen2
  r-tinytest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('77a5b63f5921f90e6e6d7daa777bb0df')
b2sums=('0ab77c4b4bd2959091e662e5fef8e2e8ea97fbf79c995cd2c378f8c81f23c3af113907d471671f8e572766c0e8b0efd7e5ca4c1056af384dbc73b76f6ce4907a')

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
