# Maintainer: Martin Reboredo <yakoyoku@gmail.com>

pkgname=godot-headers
pkgver=3.4.4
pkgrel=1
pkgdesc='Headers for the Godot API supplied by the GDNative module'
arch=('any')
url='https://godotengine.org'
license=('MIT')
source=(
  https://github.com/godotengine/$pkgname/archive/refs/tags/godot-$pkgver-stable.tar.gz
  godot.pc.in
)
sha256sums=('bb0eac00a4d5b800a4ca2555d11b4a35981bdb730b630e9bd31a0649fa1d6fd7'
            'f8e4f4cc7e5a221d6364ad5b520cafebdafb5de4f139d200f028b8cdc229647a')

prepare() {
  cd "$srcdir"/${pkgname}-godot-${pkgver}-stable

  sed "s/@VERSION@/$pkgver/" "$srcdir"/godot.pc.in > godot.pc
}

package() {
  cd "$srcdir"/${pkgname}-godot-${pkgver}-stable

  install -dm00755 "$pkgdir"/usr/include/godot
  install -Dm00644 godot.pc "$pkgdir"/usr/lib/pkgconfig/godot.pc
  install -Dm00644 LICENSE.md "$pkgdir"/usr/share/licenses/godot-headers/LICENSE.md
  rm -rf *.md images
  cp -rup * "$pkgdir"/usr/include/godot
}
