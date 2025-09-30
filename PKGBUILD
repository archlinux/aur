# Maintainer: mewset <@mewset github>
pkgname=headsetstatus
pkgver=1.1.0
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
sha256sums=('SKIP')

build() {
  cd "$srcdir/headsetstatus-$pkgver"
  cmake -B build -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  cd "$srcdir/headsetstatus-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
} 