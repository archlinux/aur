# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=drum-machine
pkgver=2.2.0
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
sha256sums=('4d8e72f61906bfbcf5693708ab6f1c9c8fd7da919f9438328523e9b236cef7e1')

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
