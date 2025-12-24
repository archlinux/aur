# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=savedesktop
pkgver=3.8.1
pkgrel=1
pkgdesc="Saves your Linux desktop environment configuration"
arch=('any')
url="https://vikdevelop.github.io/SaveDesktop"
license=('GPL-3.0-or-later')
depends=(
  '7zip'
  'dconf'
  'gtk4'
  'hicolor-icon-theme'
  'libadwaita'
  'python-dbus'
  'python-gobject'
)
makedepends=(
  'git'
  'meson'
)
source=("git+https://github.com/vikdevelop/SaveDesktop.git#tag=$pkgver")
sha256sums=('9f077494c37e73f1d79164e08e8cba5781410dd17c24a7a09cc4ec3c271bd8e3')

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
