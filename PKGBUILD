# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=letters
pkgver=0.1.1
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
sha256sums=('98b4c21c81785715c8776a837a99d32426bedf00dcddbb4e4536d634e80367f8')

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
