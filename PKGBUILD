# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=jsonvalidate
_pkgver=1.5.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Validate 'JSON' Schema"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-r6
  r-v8
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-jsonlite
  r-knitr
  r-rmarkdown
  r-testthat
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('da53e974bf9fe83b6b56c9b94ed26e29')
b2sums=('1aff03f6e2f4a7e02c8379b14e7e86cfa0277d2db9516efb486da6e9d1c93c673bff0889493bfbf8bdd22c37201e90c2f6145da27eb89921a9a6279fe7fb6820')

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
