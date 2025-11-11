# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=wattage
pkgver=1.1.0
pkgrel=1
pkgdesc="An application designed for monitoring the health and status of your power devices."
arch=('x86_64')
url="https://github.com/v81d/wattage"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'libgee'
)
makedepends=(
  'meson'
  'vala'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('5276fcf06990090575137b8aab8c8ce3b19af6de3afd3fed235a861400e8ffd3')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
