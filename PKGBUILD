# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=textcompare
pkgver=0.1.12
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
checkdepends=(
  'appstream'
  'desktop-file-utils'
)
source=("TextCompare-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('87dc4f52baa090f44262756ebb2eb5c59f0d66cf4c6f77b17694864f847c7242')

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
