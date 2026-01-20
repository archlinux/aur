# Maintainer: James Liu <contact at no-bull dot sh>

pkgname=reflector-rs-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='Retrieve and filter the latest Arch Linux mirror list (Rust implementation)'
arch=('x86_64')
url='https://github.com/james7132/reflector-rs'
license=('GPL-2.0-or-later')
provides=('reflector')
conflicts=('reflector')
depends=('openssl')
backup=('etc/xdg/reflector/reflector.conf')
source=("$pkgname-$pkgver.tar.xz::${url}/releases/download/v${pkgver}/reflector-rs-v${pkgver}-$CARCH-unknown-linux-gnu.tar.xz")
sha256sums=('adec0e955a6b1b49a4baed38472df29a6de919f20619120b37e3b007db49f0d2')

package() {
  # Install binary
  install -Dm755 "reflector" \
    "$pkgdir/usr/bin/reflector"

  # Install systemd service and timer
  install -Dm644 "reflector.service" \
    "$pkgdir/usr/lib/systemd/system/reflector.service"
  install -Dm644 "reflector.timer" \
    "$pkgdir/usr/lib/systemd/system/reflector.timer"

  # Install default configuration
  install -Dm644 "reflector.conf" \
    "$pkgdir/etc/xdg/reflector/reflector.conf"

  # Install man page
  install -Dm644 "man/reflector.1.gz" "$pkgdir/usr/share/man/man1/reflector.1.gz"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
