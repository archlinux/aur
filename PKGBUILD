# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: peippo <christoph+aur@christophfink.com>

_pkgname=webfakes
_pkgver=1.3.2
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
md5sums=('c5449f378e57d2c560daef3fda9480ed')
b2sums=('1cc47ab303cf558318126d437ec029c41f1486da6d7a008f75e146ff6618ed94397cf9326d57d6480e65320f09587da5cc185cb6f91ac44c411527d25f7d7888')

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
