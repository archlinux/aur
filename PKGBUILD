# Maintainer: Devel <Denislav08@proton.me>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=picplanner
pkgver=0.5.4
pkgrel=1
pkgdesc="Plan your next photo locations"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/Zwarf/picplanner"
license=('GPL3')
depends=('libadwaita' 'libshumate' 'libgweather-4' 'geoclue' 'geocode-glib-2' 'protobuf-c')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
b2sums=('c69ea5178fa9255fc5d27b06cc557e2a2c9e58a98ef64ad510d10a9b36391950de16c82f3128e7f6451bf98b72c3f2d1e5e4b2f78ec856650f6cb1ac303d8606')

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
