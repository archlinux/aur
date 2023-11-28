# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=phantasusLite
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Loading and annotation RNA-Seq counts matrices"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(MIT)
depends=(
  r-biobase
  r-data.table
  r-httr
  r-rhdf5client
  r-stringr
)
checkdepends=(
  r-geoquery
  r-testthat
)
optdepends=(
  r-biocstyle
  r-geoquery
  r-knitr
  r-rhdf5
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5fe0e101ac53a89dd49e077d5fb4c07d')
sha256sums=('8a2f8cd5194d5e3c3626d2e80fb27a0f98cada91ec8c59d2466b744b0105055f')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
