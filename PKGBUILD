# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=textcompare
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple desktop app to compare old and new text"
arch=('any')
url="https://github.com/josephmawa/TextCompare"
license=('GPL-3.0-or-later')
depends=(
  'gjs'
  'libadwaita'
)
makedepends=('meson')
source=("TextCompare-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f693357d4b953f2cd1258dc73d8ffdf9ec37eb60dad2b5b78503ebb11c832f1e')

build() {
  arch-meson "TextCompare-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  ln -s /usr/bin/io.github.josephmawa.TextCompare "$pkgdir/usr/bin/$pkgname"
}
