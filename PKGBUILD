# # Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=appimage-thumbnailer
pkgver=4.0.0
pkgrel=2
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
sha256sums=('73e73e1f0c098ccafc90ab46c54d7ef5c2d6fa6f92653bcdaacf6bb1faea0f69')

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
