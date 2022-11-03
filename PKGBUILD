# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=picplanner
pkgver=0.3.2
pkgrel=3
pkgdesc="Plan your next photo locations"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/Zwarf/picplanner"
license=('GPL3')
depends=('libadwaita' 'libshumate' 'libgweather-4' 'geoclue' 'geocode-glib-2' 'protobuf-c')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
b2sums=('8f027714a783a45227fc5c9c187e59a03cca71dde9f32ae00d2cb8cd48bc1976c5f886912982f5288f331393ef8179d386f6558ede32a9eed7d4b7a8a0d2d9e5')

build() {
  arch-meson "$pkgname-v$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
