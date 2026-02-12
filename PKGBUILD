# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=addwater
pkgver=1.2.9
pkgrel=2
pkgdesc="Installer for the Firefox GNOME theme"
arch=('any')
url="https://github.com/largestgithubuseronearth/addwater"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'libportal'
  'python-gobject'
  'python-packaging'
  'python-requests'
)
makedepends=('meson')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1dc6b81df82d7b63f8a2f19853a2a293a65c3aee1a880327b6097c98daa46a43')

build() {
  arch-meson "$pkgname-$pkgver" build -Dprofile=default
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
