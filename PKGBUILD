# Maintainer: Its-Alex <me@itsalex.fr>
pkgname=gp-tray
pkgver=2.0.0
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
sha256sums=('065edd9d34c21825194747c22e1462e117a9e775627b33f0fca3f37c6e73eb98')

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
