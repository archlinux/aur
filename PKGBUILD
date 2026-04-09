# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=mingle
pkgver=0.30
pkgrel=1
pkgdesc="A simple GTK4-Libadwaita app to play with Google's Emoji Kitchen."
arch=('x86_64')
url="https://github.com/halfmexican/mingle"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'json-glib'
  'libadwaita'
  'libgee'
  'libsoup3'
)
makedepends=(
  'blueprint-compiler'
  'meson'
  'vala'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8016b71e2060d0577afef54ce35d0b7d20c92475d1fd6e434830c78232fcdabd')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
