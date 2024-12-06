# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=mingle
pkgver=0.16.1
pkgrel=1
pkgdesc="A simple GTK4-Libadwaita app to play with Google's Emoji Kitchen."
arch=('x86_64')
url="https://github.com/halfmexican/mingle"
license=('GPL-3.0-or-later')
depends=(
  'libadwaita'
  'libgee'
)
makedepends=(
  'blueprint-compiler'
  'meson'
  'vala'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5d31f6980e8494a440a97171554d027fec9c7ce19236d80f9db93f94c82385fa')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
