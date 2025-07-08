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
source=("https://github.com/SW-philip/sqlch-suite/releases/download/v2.0.0/sqlch-suite-2.0.0.tar.gz")
sha256sums=('4bea15b6f7b66dacc329b6bf758202d6eb2f9ec4037eb0d40a3e6befa2110592')

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
