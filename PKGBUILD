# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=picplanner
pkgver=0.1.0
pkgrel=1
pkgdesc="Plan your next photo locations"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/Zwarf/picplanner"
license=('GPL3')
depends=('libadwaita' 'libshumate' 'libgweather' 'geocode-glib' 'protobuf' 'protobuf-c')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
b2sums=('5302d28d71c1ed624cd0997df2b572ba513d68a00f7a9b39d482ac1ee4a7c79e09448cdbe916c4a55a58f36674ce2a465132335b99d5685979bca46f263d8247')

build() {
  arch-meson "$pkgname-v$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
