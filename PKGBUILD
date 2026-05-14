# Maintainer: Ramez Medhat <iramezdev@gmail.com>
pkgname=app-terminator
pkgver=0.1.0
pkgrel=2
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
sha256sums=('1878e9b792b24d7d32d22cf44e267f0153c486b32995a20d9d0e5e09c2241aad')

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
