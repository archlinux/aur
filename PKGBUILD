# Maintainer: Philip J. Repko <philipjrepko@gmail.com>
pkgname=sqlch-suite
pkgver=2.0.0
pkgrel=1
pkgdesc="Terminal-based internet radio suite with TUI, tray, and controller"
arch=('any')
url="https://github.com/SW-philip/sqlch-suite"
license=('MIT')
depends=('bash' 'mpv' 'gtk3' 'python' 'python-gobject' 'libayatana-appindicator' 'hicolor-icon-theme')
optdepends=(
  'gum: TUI interface in sqlchknob'
  'jq: JSON parsing for radio-browser search'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/SW-philip/sqlch-suite/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('59dd1e950a79f3add93336089d55674c06eaf563613705fee64526d1d4eab3f1')

package() {
  cd "$srcdir"

  # Install executables
  install -Dm755 sqlchctl "$pkgdir/usr/bin/sqlchctl"
  install -Dm755 sqlchknob "$pkgdir/usr/bin/sqlchknob"
  install -Dm755 sqlchtray "$pkgdir/usr/bin/sqlchtray"

  # Optional icon (if included)
  install -Dm644 sqrlch_icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/sqlch.png"

  # Default config files (for skel-based setup)
  install -Dm644 stations.default "$pkgdir/etc/skel/.config/sqlch/stations"
  install -Dm644 channels.default "$pkgdir/etc/skel/.config/sqlch/channels"

  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
