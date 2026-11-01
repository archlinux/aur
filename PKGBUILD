# Maintainer: Its-Alex <me@itsalex.fr>
pkgname=gp-tray
pkgver=2.0.1
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
sha256sums=('d6fd463516be9f4759cbfc967e6084865e69f5e11ced3e4a1a70a3b4955115be')

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
