# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=keymaker
pkgver=1.5.1
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
sha256sums=('fc54ec2b5619931fd9861b0606ac96372fc6d36bff61f3ba16aedf965ff7b664')

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
