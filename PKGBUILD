# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=addwater
pkgver=1.2.7
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
sha256sums=('af09df0f31d89a2ff54c69ad9179994e0c1739dcb4e6bd3c3f9ffaa54354229e')

build() {
  arch-meson "$pkgname-$pkgver" build -Dprofile=default
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs || :
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
