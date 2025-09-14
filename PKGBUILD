# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=pigment
pkgver=0.5.5
pkgrel=1
pkgdesc="Extract color palettes from your images"
arch=('any')
url="https://github.com/Jeffser/Pigment"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'libportal'
  'python-colorthief'
  'python-gobject'
  'python-pillow'
  'python-pydbus'
)
makedepends=(
  'blueprint-compiler'
  'meson'
)
source=("Pigment-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('4b709dddf892a7eb0565e0d9b25c76baa753e2d4cdba2a01cf24bbedb5eb59d7')

build() {
  arch-meson "Pigment-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
