# Maintainer: Kreuder <mk@singular.de>
pkgname=drew
pkgver=0.6.0
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
sha256sums=('60c1f9d0deca0dfa2ad6a3becb1fd4a94b4e67a55de900c6e8480bbbb0ee9508')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$pkgname-$pkgver/COPYRIGHT" "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
}
