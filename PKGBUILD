# Maintainer: Kreuder <mk@singular.de>
pkgname=edith
pkgver=0.8.0
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
sha256sums=('838a78868b3d2228741f5ec22fac622db8cabba31e0ed4d1c02fb60f81429290')

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
