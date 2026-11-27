# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=keymaker
pkgver=1.6.0
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
  'openssh'
  'qrencode'
  'simdutf'
  'vte4'
  'zbar'
)
makedepends=(
  'blueprint-compiler'
  'meson'
  'vala'
)
checkdepends=(
  'appstream'
  'desktop-file-utils'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1f4ee88b43f3e157c6dae3be34326587965ac4d1fac9ee2e922281a1cca3a0e7')

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
