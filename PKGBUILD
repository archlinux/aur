# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=addwater
pkgver=1.2.6
pkgrel=1
pkgdesc="Installer for the Firefox GNOME theme"
arch=('any')
url="https://github.com/largestgithubuseronearth/addwater"
license=('GPL-3.0-or-later')
depends=(
  'libadwaita'
  'libportal'
  'python-gobject'
  'python-packaging'
  'python-requests'
)
makedepends=('meson')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4c39a6ad971b0bafde435d0e2d8c3de13c2a9c969ca4b7eccfb52d65b34da1de')

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
