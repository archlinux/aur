# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: peippo <christoph+aur@christophfink.com>

_pkgname=webfakes
_pkgver=1.4.0
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
md5sums=('addd79c7f37ca4d73fa2371bf755941c')
b2sums=('aef4e3e6313bcb453b3c90d0ac6d8c4ba98fbd3a42c13892ba7fe6fb699cd1290d7b368b9c37b26dbf553ad997428546c7c0d3a9dd2fbf00ffbe3d3a420f3f4b')

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
