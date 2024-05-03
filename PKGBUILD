# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gypsum
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interface to the gypsum REST API"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-filelock
  r-httr2
  r-jsonlite
  r-paws.storage
)
checkdepends=(
  r-dbi
  r-jsonvalidate
  r-rsqlite
  r-testthat
)
optdepends=(
  r-biocstyle
  r-dbi
  r-digest
  r-jsonvalidate
  r-knitr
  r-rmarkdown
  r-rsqlite
  r-s4vectors
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7d2d34d2d340c8fd9169e7cb1033992a')
b2sums=('3203b6704baebc3fd38c52461c4fa35ae4e43485b946f0e29bc5fb3532fe28cd865be929d65d54353833c334e3412e76e6180904016115b4602bd8695c1f75b4')

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
