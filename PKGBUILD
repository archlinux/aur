# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=addwater
pkgver=1.2.8
pkgrel=1
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
sha256sums=('430ec04606ca601d77b205bb14baf19ae151a0cc185822cc2b55b86851a065e7')

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
