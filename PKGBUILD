# # Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=appimage-thumbnailer
pkgver=4.0.0
pkgrel=1
pkgdesc="Generates AppImage thumbnails for Linux desktops"
arch=('x86_64' 'aarch64')
url="https://github.com/kem-a/appimage-thumbnailer"
license=('MIT')
depends=(
  'cairo'
  'glibc'
  'dwarfs'
  'librsvg'
  'squashfs-tools'
)
makedepends=('meson')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0fb77483ce4ed7a944a1ce886168db7ae6dea5f50d36f9d8c80688bcea28c287')

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
