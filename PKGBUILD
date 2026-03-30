# Maintainer: Kreuder <mk@singular.de>
pkgname=edith
pkgver=0.4.11
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
sha256sums=('090cb8d17674bcb0c8756dba83ea4daaeac2bd13d809412f536f110e4d51a0d1')

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
