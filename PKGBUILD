# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=appimage-thumbnailer
pkgver=4.1.1
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
sha256sums=('53c84895b839bd6f8632d4fefd6a15714e4bf8aecc205f212464bbcf7a278f59')

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
