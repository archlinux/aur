# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=mslp
_pkgver=1.16.0
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
md5sums=('abea798ac2fe52002049aac6d38eac95')
b2sums=('253d5046c8c50bbd0b16a0b443e67a810499e9fad6545c002e73baefd4e27ff6b8061f002ea0aad59d87bf3598a8e63cf01d117c42690e2c5ed4d69f56d3be0a')

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
