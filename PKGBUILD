# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=drum-machine
pkgver=2.0.0
pkgrel=1
pkgdesc="A drum machine application, built with Python, GTK4, libadwaita, and Pygame."
arch=('any')
url="https://apps.gnome.org/DrumMachine"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'python-gobject'
  'python-mido'
  'python-numpy'
  'python-pygame'
)
makedepends=(
  'blueprint-compiler'
  'meson'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Revisto/drum-machine/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('97bdb13711f2e65aa6e6df590f5c0d0e132b5915c4ee0925cb5e892da3ced6f2')

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
