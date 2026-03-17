# Maintainer: Kreuder <mk@singular.de>
pkgname=edith
pkgver=0.4.10
pkgrel=1
pkgdesc="GTK4 native SFTP client for live remote file editing"
arch=('any')
url='https://github.com/mkay/edith'
license=('MIT')
depends=(
  'python'
  'python-gobject'
  'gtk4'
  'libadwaita'
  'webkitgtk-6.0'
  'python-paramiko'
  'python-keyring'
  'python-defusedxml'
)
makedepends=('meson' 'npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mkay/edith/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a37954a22325d757e3dd142e7302d040336d263a091cc9a4ff009651d03a6a9e')

build() {
  cd "$pkgname-$pkgver"
  bash scripts/fetch-monaco.sh
  arch-meson . build
  meson compile -C build
}

package() {
  cd "$pkgname-$pkgver"
  meson install -C build --destdir "$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
