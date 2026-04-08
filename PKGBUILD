# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: peippo <christoph+aur@christophfink.com>

_pkgname=webfakes
_pkgver=1.4.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('65b7c8dce3b97f42c6a278e6ffd6ca1c')
b2sums=('ffd024785c9d9de942b710caf748205aa505049c2d54fd403f5ddb34d8bbe1155aa682a90e3257960fa5e893d04ac66431abd68b953cde52e6f895977b583dca')

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
