# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=letters
pkgver=0.3.0
pkgrel=1
pkgdesc="Modern word processor for the GNOME desktop"
arch=('any')
url="https://gitlab.gnome.org/jcardullo/letters"
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
source=("git+https://gitlab.gnome.org/jcardullo/letters.git#tag=$pkgver")
sha256sums=('3c355e4fdf91e6a7127729808d8130d20a7c9d3033fae444bbe50b883a04be3c')

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
