# Maintainer: Radu Macocian <radu@macocian.com>
pkgname=omni-shell
pkgver=0.0.1
pkgrel=1
pkgdesc="Quickshell status bar, notification center and control center for Hyprland, with weather, clipboard history and an integrated omni-launcher."
arch=('any')
url="https://git.estatecloud.org/radumaco/omni-shell"
license=('GPL-3.0-or-later')
depends=('quickshell' 'qt6-declarative' 'omni-launcher' 'bash' 'curl' 'python'
         'cliphist' 'wl-clipboard' 'libpulse' 'brightnessctl' 'bluez-utils'
         'networkmanager' 'libnotify')
optdepends=('hyprland: workspaces module and layer rules'
            'satty: screenshot notification actions'
            'wifitui: TUI handoff for enterprise Wi-Fi networks'
            'bluetui: TUI handoff for Bluetooth devices needing a passkey')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4e71205415f6831d1e335a27250e49a2d9b0ce3e32173e7a2470f5d4fdc5b383')

package() {
  cd "$srcdir/$pkgname"

  # Quickshell config tree — shell.qml plus the singletons, panels and
  # per-widget modules it loads relative to itself.
  install -dm755 "$pkgdir/usr/share/$pkgname"
  install -m644 *.qml "$pkgdir/usr/share/$pkgname/"
  install -m644 *.js "$pkgdir/usr/share/$pkgname/"

  install -dm755 "$pkgdir/usr/share/$pkgname/modules"
  install -m644 modules/*.qml "$pkgdir/usr/share/$pkgname/modules/"

  install -Dm755 bin/omni-shell "$pkgdir/usr/bin/omni-shell"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
