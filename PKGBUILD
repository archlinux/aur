# Maintainer: Kreuder <mk@singular.de>
pkgname=edith
pkgver=0.11.1
pkgrel=1
pkgdesc="GTK4 native SFTP client for live remote file editing"
arch=('any')
url='https://github.com/mkay/edith'
license=('GPL-3.0-or-later')
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
sha256sums=('8ade3005b3c7f614ad1a1134f6e8f0705110deb73b9f42fe1ae0ccbfe03641df')

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
