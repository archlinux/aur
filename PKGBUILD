# Maintainer: Its-Alex <me@itsalex.fr>
pkgname=gp-tray
pkgver=2.0.2
pkgrel=1
pkgdesc="GlobalProtect VPN system-tray indicator for gpclient with multi-portal switching, desktop alerts and a systemd user service"
arch=('x86_64' 'aarch64')
url="https://github.com/Its-Alex/gp-tray"
license=('MIT')
install=gp-tray.install
depends=('polkit' 'globalprotect-openconnect' 'hicolor-icon-theme'
         'iproute2' 'systemd' 'xdg-utils')
makedepends=('rust' 'cargo')
optdepends=('gnome-shell-extension-appindicator: tray icon on vanilla GNOME Shell')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d914f3f94cc22b0ea60334c957af632fdd6f7ccb0fc12906120fc5ddb5982275')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
