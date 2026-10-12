# Maintainer: Kreuder <mk@singular.de>
pkgname=drew
pkgver=0.4.0
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
optdepends=(
  'gtk4-layer-shell: pinned images stay above other windows'
)
makedepends=(
  'meson'
  'gettext'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/mkay/drew/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c18747e10b7a8a9b0d34313e5e713e5a57ccc519e9d08026ce3deda8387dc104')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$pkgname-$pkgver/COPYRIGHT" "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
}
