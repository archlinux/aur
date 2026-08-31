# Maintainer: Radu Macocian <radu@macocian.com>
pkgname=omni-launcher
pkgver=0.0.6
pkgrel=1
pkgdesc="Application launcher overlay built on Quickshell, with calculator, unit/currency conversion, unicode search and Giphy search. Installable as a Quickshell QML module (OmniLauncher) for embedded use or standalone via omni-launcher."
arch=('any')
url="https://git.macocian.com/radumaco/omni-launcher"
license=('GPL-3.0-or-later')
depends=('quickshell' 'qt6-declarative' 'wl-clipboard' 'curl' 'python' 'glib2' 'inotify-tools')
optdepends=('hyprland: close-on-workspace-change and focus-grab integration')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1ddf30901df20bf084aaf29a9371b3ebbdf7440e2492ee62d2ff1cfd82f7a3a1')

package() {
  cd "$srcdir/$pkgname"

  # QML module — installed on the Qt6 import path so both the standalone
  # shell.qml and any host quickshell config can `import OmniLauncher`.
  install -dm755 "$pkgdir/usr/lib/qt6/qml/OmniLauncher"
  install -m644 module/* "$pkgdir/usr/lib/qt6/qml/OmniLauncher/"

  # Standalone entry point + launcher scripts.
  install -dm755 "$pkgdir/usr/share/$pkgname"
  install -m644 shell.qml "$pkgdir/usr/share/$pkgname/"

  install -Dm755 bin/omni-launcher "$pkgdir/usr/bin/omni-launcher"
  install -Dm755 bin/omni-launcher-toggle "$pkgdir/usr/bin/omni-launcher-toggle"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
