# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=textcompare
pkgver=0.1.11
pkgrel=1
pkgdesc="A simple desktop app to compare old and new text"
arch=('any')
url="https://github.com/josephmawa/TextCompare"
license=('GPL-3.0-or-later')
depends=(
  'gjs'
  'gtk4'
  'gtksourceview5'
  'libadwaita'
)
makedepends=('meson')
source=("TextCompare-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fd7cc39668047c399de3ee1e3d48993a88854bd52a1908e8ec8c4003c9523f8c')

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
