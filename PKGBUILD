# Maintainer: mewset <@mewset github>
pkgname=headsetstatus
pkgver=1.2.1
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
sha256sums=('76db6fe1f8b472f7e97c26d70365bf38e4dc44d5d547c8f226575288086ab5bc')

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
