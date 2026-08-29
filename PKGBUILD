# Maintainer: Radu Macocian <radu@macocian.com>
pkgname=omni-shell
pkgver=0.1.6
pkgrel=1
pkgdesc="Quickshell status bar, notification center and control center for Hyprland, with weather, clipboard history and an integrated omni-launcher."
arch=('any')
url="https://git.macocian.com/radumaco/omni-shell"
license=('GPL-3.0-or-later')
depends=('quickshell' 'qt6-declarative' 'omni-launcher' 'bash' 'curl' 'python'
  'cliphist' 'wl-clipboard' 'libpulse' 'brightnessctl' 'bluez-utils'
  'networkmanager' 'libnotify')
optdepends=('hyprland: workspaces module and layer rules'
  'satty: screenshot notification actions'
  'wifitui: TUI handoff for enterprise Wi-Fi networks'
  'bluetui: TUI handoff for Bluetooth devices needing a passkey'
  'power-profiles-daemon: Control Center power profile tile'
  'pacman-contrib: checkupdates, for the pending updates module'
  'wf-recorder: screen recording indicator'
  'nvidia-utils: GPU usage and temperature on NVIDIA cards')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f0ac18a3d15d154980141da1c3baf4b78bc0369cf05dabf970e4373c760cb247')

package() {
  cd "$srcdir/$pkgname"

  # Quickshell config tree — shell.qml plus the singletons, panels and
  # per-widget modules it loads relative to itself.
  install -dm755 "$pkgdir/usr/share/$pkgname"
  install -m644 *.qml "$pkgdir/usr/share/$pkgname/"
  install -m644 *.js "$pkgdir/usr/share/$pkgname/"

  install -dm755 "$pkgdir/usr/share/$pkgname/modules"
  install -m644 modules/*.qml "$pkgdir/usr/share/$pkgname/modules/"

  # Drop-in directory for Control Center tiles contributed by other packages.
  # Shipped even though it is empty, so packages have a directory to install
  # into and the shell is not scanning a path that does not exist.
  install -dm755 "$pkgdir/usr/share/$pkgname/extensions"

  install -Dm755 bin/omni-shell "$pkgdir/usr/bin/omni-shell"
  install -Dm755 bin/omni-shell-ipc "$pkgdir/usr/bin/omni-shell-ipc"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
