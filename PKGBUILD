# Maintainer: Martin Reboredo <yakoyoku@gmail.com>

pkgname=godot-headers
pkgver=3.4.2
pkgrel=1
pkgdesc='Headers for the Godot API supplied by the GDNative module'
arch=('any')
url='https://godotengine.org'
license=('MIT')
source=(
  https://github.com/godotengine/$pkgname/archive/refs/tags/godot-$pkgver-stable.tar.gz
  godot.pc.in
)
sha256sums=(
  8933bc697a411902f2f429aeca6c2336b4f3ca27d66f11851943fd81ffdbf5e0
  f8e4f4cc7e5a221d6364ad5b520cafebdafb5de4f139d200f028b8cdc229647a
)

prepare() {
  cd "$srcdir"/godot-headers-*

  sed "s/@VERSION@/$pkgver/" "$srcdir"/godot.pc.in > godot.pc
}

package() {
  cd "$srcdir"/godot-headers-*

  install -dm00755 "$pkgdir"/usr/include/godot
  install -Dm00644 godot.pc "$pkgdir"/usr/lib/pkgconfig/godot.pc
  install -Dm00644 LICENSE.md "$pkgdir"/usr/share/licenses/godot-headers/LICENSE.md
  rm -rf *.md images
  cp -rup * "$pkgdir"/usr/include/godot
}
