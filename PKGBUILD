# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=keymaker
pkgver=1.4.0
pkgrel=1
pkgdesc="A central hub for managing all your SSH keys."
arch=('x86_64')
url="https://github.com/tobagin/keymaker"
license=('GPL-3.0-or-later')
depends=(
  'fast_float'
  'gtk4'
  'json-glib'
  'libadwaita'
  'libgee'
  'libsecret'
  'libsoup3'
  'openssh'
  'qrencode'
  'simdutf'
  'vte4'
  'webkitgtk-6.0'
  'zbar'
)
makedepends=(
  'blueprint-compiler'
  'meson'
  'vala'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c6171ed249dab7f005ff48adea356c5d1ba6211d8d8f1fcd46a0547be150cd0d')

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
