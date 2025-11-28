# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=wattage
pkgver=1.2.0
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
  'meson'
  'vala'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6d3f2a92c109c7cf9db70e1b41fd7619f233f823f7a8e24b8b0f044da139c18d')

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
