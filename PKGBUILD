# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=mslp
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Predict synthetic lethal partners of tumour mutations"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
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
md5sums=('8d78607401143e315c9ad75923a0c9c5')
sha256sums=('d3647c9e496698ca1f287e9d24d112c833622bc40dca683bb997af3d43768ac4')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla tinytest.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
