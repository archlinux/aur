pkgname=passkeyd
pkgver=1.8.0
pkgrel=2
pkgdesc="Opinionated WebAuthn authenticator backed by a TPM"
arch=('x86_64')
license=('GPL3')
depends=("tpm2-tss")
makedepends=()
url="https://github.com/bjn7/passkeyd"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bjn7/passkeyd/releases/download/v$pkgver/passkeyd-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('c61ffd4902fc701191a81c1d274e701a5b0cae8451c0c1ed3a1e3fbfdfdad268')
options=('!debug')
backup=('etc/passkeyd.conf' 'usr/share/passkeyd/theme.conf')

package() {
  cd "$srcdir"

  # Binary installation
  install -Dm755 passkeyd "$pkgdir/usr/bin/passkeyd"
  install -Dm755 passkeyd-manager "$pkgdir/usr/bin/passkeyd-manager"
  install -Dm755 passkeyd-migrate "$pkgdir/usr/bin/passkeyd/passkeyd-migrate"

  # UI binary installation
  install -Dm755 passkeyd-enroll "$pkgdir/usr/lib/passkeyd/passkeyd-enroll"
  install -Dm755 passkeyd-select "$pkgdir/usr/lib/passkeyd/passkeyd-select"
  install -Dm755 passkeyd-selection "$pkgdir/usr/lib/passkeyd/passkeyd-selection"

  # Database directory
  install -d -m 700 -o root -g root "$pkgdir/var/lib/passkeyd/database"

  # Configuration files
  install -Dm644 passkeyd.conf "$pkgdir/etc/passkeyd.conf"
  install -Dm644 theme.conf "$pkgdir/usr/share/passkeyd/theme.conf"

  # Systemd service
  install -Dm644 "$srcdir/passkeyd.service" "$pkgdir/usr/lib/systemd/system/passkeyd.service"

  # Icons
  install -Dm644 icons/32x32/passkeyd.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/passkeyd.png"
  install -Dm644 icons/64x64/passkeyd.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/passkeyd.png"
}

