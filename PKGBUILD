# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=fauxpas
_pkgver=0.5.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="HTTP Error Helpers"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-httpcode
  r-r6
  r-whisker
)
optdepends=(
  r-crul
  r-curl
  r-httr
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6ee52b2a7c648240502bbb8b57a2222e')
b2sums=('5a2b89683e178871b7c41a492a0ee095cef2a8c457f8affa911de020628ee17f131ecbc480738d2e117f7735fdbdeef1f09d8b6d30ff5842bf61a7583302b7de')

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
