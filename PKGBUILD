pkgname=8bitdo-pro2-a-mode-hid-daemon
pkgver=0.1.0
pkgrel=1
pkgdesc='8BitDo Pro 2 A-mode Bluetooth HID to uinput daemon'
arch=('any')
url='https://github.com/sidevesh/8bitdo-pro2-a-mode-hid-daemon'
license=('MIT')
depends=('python' 'systemd')
makedepends=('git')
provides=("$pkgname")
conflicts=("$pkgname")
source=(
  "$pkgname-$pkgver::git+https://github.com/sidevesh/8bitdo-pro2-a-mode-hid-daemon.git#tag=$pkgver"
)
sha256sums=('SKIP')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/8bitdo-pro2-a-mode-hid-daemon.py" "$pkgdir/usr/bin/8bitdo-pro2-a-mode-hid-daemon"
  install -Dm644 "$srcdir/$pkgname-$pkgver/8bitdo-pro2-a-mode-hid-daemon.service" "$pkgdir/usr/lib/systemd/system/8bitdo-pro2-a-mode-hid-daemon.service"
}

post_install() {
  echo '==> 8BitDo Pro 2 A-mode HID daemon installed'
  echo '==> To enable and start the daemon, run:'
  echo '    sudo systemctl enable --now 8bitdo-pro2-a-mode-hid-daemon.service'
  echo '==> To view logs:'
  echo '    journalctl -u 8bitdo-pro2-a-mode-hid-daemon.service -f'
}
