# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=drum-machine
pkgver=1.5.0
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
makedepends=('meson')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Revisto/drum-machine/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2eb9205bf9549b35cba65dd266639e9fa801ba06af146a1d7e5ef9529ab26684')

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
