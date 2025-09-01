# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=redux
_pkgver=1.1.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="R Bindings to 'hiredis'"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  hiredis
  r-r6
  r-storr
)
checkdepends=(
  r-sys
  r-testthat
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-sys
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8090798d9567e2c0a5ee9bc1db1179ca')
b2sums=('ea25a92c589e9ab8c25ace1ecd3d3a5de818df861d08bb87c9ceb4a2d032196a82ee9739c242706e59cee4070ac9ca41a2d9374674a09489ca109f19a37fc522')

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
}
