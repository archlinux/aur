# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=letters
pkgver=0.2.0
pkgrel=1
pkgdesc="Modern word processor for the GNOME desktop"
arch=('any')
url="https://codeberg.org/eyekay/letters"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'python-gobject'
  'python-pypandoc'
  'python-weasyprint'
  'webkitgtk-6.0'
)
makedepends=(
  'blueprint-compiler'
  'git'
  'meson'
)
source=("git+https://codeberg.org/eyekay/letters.git#tag=$pkgver")
sha256sums=('5abd0837c3596bbbe2e45d935dd8bb7649d0a8da55a0bdd07f07ca114fc562f1')

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
