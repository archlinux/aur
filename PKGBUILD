# Maintainer: mewset <@mewset github>
pkgname=headsetstatus
pkgver=1.2.0
pkgrel=1
pkgdesc="A fast Linux tray app for headset battery and connection status with desktop notifications"
arch=('x86_64')
url="https://github.com/mewset/headsetstatus"
license=('MIT')
depends=('qt6-base' 'upower')
optdepends=('libnotify: desktop notifications'
            'dunst: notification daemon'
            'mako: notification daemon for Wayland'
            'swaync: notification daemon for Sway')
makedepends=('cmake' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2d72f6c66286058697e5166de731eac966587d8dc42cef90a413fd365b427d43')

build() {
  cd "$srcdir/headsetstatus-$pkgver"
  cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "$srcdir/headsetstatus-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
