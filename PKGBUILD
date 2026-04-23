# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=addwater
pkgver=1.3
pkgrel=1
pkgdesc="Installer for the Firefox GNOME theme"
arch=('any')
url="https://github.com/largestgithubuseronearth/addwater"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'libportal'
  'libportal-gtk4'
  'python-gobject'
  'python-packaging'
  'python-requests'
)
makedepends=('meson')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9684a65533cfeb50ec99ea5cdc9e80283fc1738313147aaee72287bd32b782a6')

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
