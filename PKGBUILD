# Maintainer: Florian Pelz <pelzflorian at pelzflorian.de>
pkgname=haunt
pkgver=0.2.6
pkgrel=1
pkgdesc="Static site generator written in Guile Scheme"
arch=('any')
url="https://haunt.dthompson.us"
license=('GPL3')
depends=('guile')
optdepends=('guile-reader: Skribe support'
            'guile-commonmark: CommonMark support')
makedepends=('guile-reader' 'guile-commonmark')
source=("https://files.dthompson.us/haunt/${pkgname}-${pkgver}.tar.gz"
        "https://files.dthompson.us/haunt/${pkgname}-${pkgver}.tar.gz.asc")
sha512sums=('214d1a843385aeb428fecc45ee1f1f0c4e7024e80dd4092dbc17f3f7e8e5ab01d75b6bb4415719685b1162193381db5e5e7b91ac5d5178238ed8c856bf8fad55'
            '50ffe5b2da9b907d43e36b516961726e74a75779cd24fbfbaca166e814ba4b83ca8e8f0bdd0c4357e25853d3dfc264e9db026bfe00ce3719d812ca16015a8df8')
validpgpkeys=('8CCBA7F552B9CBEAE1FB29158328C7470FF1D807')

build() {
  cd "$pkgname"-"$pkgver"
  ./configure --prefix=/usr
  make
}

# `make check` is known to fail on Guile 2.2.7.  See
# <https://lists.gnu.org/archive/html/guile-user/2022-02/msg00046.html>.
# Therefore disable check() for now:
#
# check() {
#   cd "$pkgname"-"$pkgver"
#   make check
# }

package() {
  cd "$srcdir"/"$pkgname"-"$pkgver"
  make DESTDIR="$pkgdir/" install
}
