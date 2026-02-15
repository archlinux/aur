# Maintainer: mewset <@mewset github>
pkgname=headsetstatus
pkgver=1.2.2
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
sha256sums=('b6c41b61c980d9ba610c12c4e8dec5edbb78efdc29ad4841d5c243a66461f735')

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
