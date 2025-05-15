# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=textcompare
pkgver=0.1.3
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
sha256sums=('914638394e38f960e6b256398175b4a68445ba94b4a7ea49d79921bcb2d3782e')

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
