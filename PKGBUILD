# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=wattage
pkgver=1.5.1
pkgrel=1
pkgdesc="An application designed for monitoring the health and status of your power devices."
arch=('x86_64')
url="https://github.com/v81d/wattage"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'libgee'
  'upower'
)
makedepends=(
  'blueprint-compiler'
  'meson'
  'vala'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ce8a4e30fde712544250a0e64f9acf8233b99a572c74f9ff7cd8cc0f633160d0')

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
