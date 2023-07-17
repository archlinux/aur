# Maintainer: Hugo Parente Lima <hugo.pl@gmail.com>

pkgname=gnome-rtfm
pkgver=0.2.0
pkgrel=2
pkgdesc="Offline documentation browser, dash docset reader"
arch=("x86_64")
url="https://github.com/hugopl/rtfm"
license=("MIT")
depends=("gc" "libevent" "pcre" "libadwaita>=1:1.3.3" "sqlite" "webkitgtk-6.0")
makedepends=("make" "crystal>=1.8.2" "shards>=0.14.0" "unzip" "gtk4-docs" "pango-docs" "libadwaita-docs")
source=("$pkgname-$pkgver.tar.gz::https://github.com/hugopl/rtfm/archive/v${pkgver}.tar.gz")
sha256sums=('ea56352aa39954d77d6d712164abcbdd1f66d189e228065f03c2c8b88ebf00e5')

build() {
  cd "$srcdir/rtfm-$pkgver"
  shards install
  ./bin/gi-crystal
  make
}

package() {
  cd "$srcdir/rtfm-$pkgver"
  make install DESTDIR="${pkgdir}"
}
