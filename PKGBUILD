# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=phantasusLite
_pkgver=1.10.0
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
md5sums=('b3a578c9da8f8f9944a3a0ee100c371d')
b2sums=('8d9315f4cbb2e5d7605f4c845e8758be5c79546511320e449e73a57da3b216a6e73d70c98530a58106428b1ab011aa961ef90ce40b2a2b1e1d891ef3b4f9cfbb')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

#check() {
#  cd "$_pkgname/tests"
#  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
#}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
