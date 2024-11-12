# Maintainer: Patrick McCarty <pnorcks at gmail.com>
# Contributor: Florian Pelz <pelzflorian at pelzflorian.de>

pkgname=haunt
pkgver=0.3.0
pkgrel=2
pkgdesc="Static site generator written in Guile Scheme"
arch=('any')
url="https://haunt.dthompson.us"
license=('GPL-3.0-or-later')
depends=('guile')
optdepends=('guile-reader: Skribe support'
            'guile-commonmark: CommonMark support'
            'rsync: integrated publishing with rsync'
            'hut: integrated publishing to Sourcehut')
makedepends=('guile-reader' 'guile-commonmark')
source=("https://files.dthompson.us/haunt/${pkgname}-${pkgver}.tar.gz"
        "https://files.dthompson.us/haunt/${pkgname}-${pkgver}.tar.gz.asc")
sha256sums=('98babed06be54a066c3ebc94410a91eb7cc48367e94d528131d3ba271499992b'
            'SKIP')
validpgpkeys=('8CCBA7F552B9CBEAE1FB29158328C7470FF1D807')

build() {
  cd "$pkgname"-"$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname"-"$pkgver"
  make check
}

package() {
  cd "$srcdir"/"$pkgname"-"$pkgver"
  make DESTDIR="$pkgdir/" install
}
