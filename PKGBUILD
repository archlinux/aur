# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=appimage-thumbnailer
pkgver=4.1.0
pkgrel=1
pkgdesc="Generates AppImage thumbnails for Linux desktops"
arch=('x86_64' 'aarch64')
url="https://github.com/kem-a/appimage-thumbnailer"
license=('MIT')
depends=(
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'dwarfs'
  'librsvg'
  'squashfs-tools'
)
makedepends=('meson')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c099e1c33539422c675b04b80a3d4fc5eb11ebb88eaaf5c6c9c92e9dc784b9fe')

build() {
  arch-meson "$pkgname-$pkgver" build \
    -Dbundle_dwarfs=false \
    -Dbundle_squashfs=false
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  cd "$pkgname-$pkgver"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
