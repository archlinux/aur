# Maintainer: Kreuder <mk@singular.de>
pkgname=drew
pkgver=0.2.0
pkgrel=1
pkgdesc='Image annotation for Wayland. Bells and whistles included'
arch=('any')
url='https://github.com/mkay/drew'
license=('GPL-3.0-only')
depends=(
  'python'
  'python-gobject'
  'python-cairo'
  'python-pillow'
  'gtk4'
  'libadwaita'
  'gdk-pixbuf2'
)
makedepends=(
  'meson'
  'gettext'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/mkay/drew/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('43c79335eadbad65d4b6d8382b0f3dc83e8f904727d19a75bb83207a091dbb35')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$pkgname-$pkgver/COPYRIGHT" "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
}
