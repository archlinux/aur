# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=keymaker
pkgver=1.1.1
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
sha256sums=('990793cf64c2353bad810b2674f22ba4f63228b5a711ca75d968a2e0bda8851c')

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
