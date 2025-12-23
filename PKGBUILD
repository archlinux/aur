# # Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=appimage-thumbnailer
pkgver=3.0.1
pkgrel=1
pkgdesc="Generates AppImage thumbnails for Linux desktops"
arch=('x86_64' 'aarch64')
url="https://github.com/kem-a/appimage-thumbnailer"
license=('MIT')
depends=(
  '7zip'
  'cairo'
  'glibc'
  'dwarfs'
  'librsvg'
)
makedepends=('meson')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7bb03ff4315e40c5cfb7e69101a427d360e4e18710e6c3af9d13952af4cd0d28')

build() {
  arch-meson "$pkgname-$pkgver" build -Dbundle_dwarfs=false
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  cd "$pkgname-$pkgver"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
