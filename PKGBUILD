# Maintainer: Ramez Medhat <iramezdev@gmail.com>
pkgname=app-terminator
pkgver=0.1.0
pkgrel=1
pkgdesc="Unified GTK4/libadwaita manager for installed applications across system packages, Flatpak, Snap, and AppImage"
arch=('any')
url="https://github.com/r6mez/Terminator"
license=('GPL-3.0-or-later')
depends=(
  'gjs'
  'gtk4'
  'libadwaita'
  'glib2'
  'packagekit'
  'polkit-gnome'
)
makedepends=(
  'meson'
  'ninja'
  'gettext'
  'appstream'
  'desktop-file-utils'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/r6mez/Terminator/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ea64e743e7fa758ffaa041fad279fa3f7bf64fdda571ff6cec62b0ac8b2ccbe2')

build() {
  arch-meson "Terminator-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || true
}

package() {
  meson install -C build --destdir "$pkgdir"
}
