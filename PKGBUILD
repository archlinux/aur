# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: peippo <christoph+aur@christophfink.com>

_pkgname=webfakes
_pkgver=1.3.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Fake Web Apps for HTTP Testing"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r
)
optdepends=(
  r-brotli
  r-callr
  r-covr
  r-curl
  r-digest
  r-glue
  r-httpuv
  r-httr
  r-jsonlite
  r-processx
  r-testthat
  r-withr
  r-xml2
  r-zip
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6b692947fd7d1b7bbf748411955659d4')
b2sums=('0664d742b38849bb8703c2ffe994d4c9cd4d45d012636e3d4f3c8825a241ba1895ce06f81ba024dcc0cf9f2a6525113f2d457767e437874d0b14e66835df2b86')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
