# Maintainer: Ramez Medhat <iramezdev@gmail.com>
pkgname=app-terminator
pkgver=0.2.0
pkgrel=1
pkgdesc="Unified application uninstaller across system packages, Flatpak, Snap, and AppImage"
arch=('any')
url="https://github.com/r6mez/App-Terminator"
license=('GPL-3.0-or-later')
depends=(
  'gjs'
  'gtk4'
  'libadwaita'
  'glib2'
  'packagekit'
)
makedepends=(
  'meson'
  'ninja'
  'gettext'
  'appstream'
  'desktop-file-utils'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/r6mez/App-Terminator/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2595f97ecc7bdff1ccebbe814e785976aed96c633b3afd93d4cb9907680e17f3')

build() {
  arch-meson "App-Terminator-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || true
}

package() {
  meson install -C build --destdir "$pkgdir"
}
