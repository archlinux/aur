# Maintainer: Kreuder <mk@singular.de>
pkgname=edith
pkgver=0.4.19
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
sha256sums=('0fa91e2dce734593c30128b6f835a213186ae365e23ea23a322caa87d42c3f11')

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
