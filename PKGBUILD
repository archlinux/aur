# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=savedesktop
pkgver=4.1
pkgrel=2
pkgdesc="Saves your Linux desktop environment configuration"
arch=('any')
url="https://vikdevelop.github.io/SaveDesktop"
license=('GPL-3.0-or-later')
depends=(
  '7zip'
  'dbus'
  'dconf'
  'gtk4'
  'gvfs'
  'hicolor-icon-theme'
  'libadwaita'
  'libnotify'
  'python-gobject'
  'xdg-utils'
)
makedepends=(
  'git'
  'meson'
)
source=("git+https://github.com/vikdevelop/SaveDesktop.git#tag=$pkgver")
sha256sums=('170d99820a0a9990a96c810ac630daaaf4486c7ddb410f1515004fd11a192723')

build() {
  arch-meson SaveDesktop build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
