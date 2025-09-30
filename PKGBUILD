# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=savedesktop
pkgver=3.7.1
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
sha256sums=('45ffe0750199e4844775717a18457e4e5b9479879cf68b39fdafc1485c981e14')

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
