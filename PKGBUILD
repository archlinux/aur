# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=phantasusLite
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Loading and annotation RNA-seq counts matrices"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
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
md5sums=('4a03bee3356b509e2ef79d7177656a38')
b2sums=('2266b8d3d16150958e01be1495d38a8cfb8a549168b9f4f1d7a08191e85d3cf6b192580f933fa7cb59f46279bfc2ef1094e463a98363cd8b0a66d7719ceefb13')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
