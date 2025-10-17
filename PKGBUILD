# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=wattage
pkgver=1.0.3
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
sha256sums=('714c840fe6a766719b791598072b7a0965eac2b469fe358459565e1e1c700363')

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
