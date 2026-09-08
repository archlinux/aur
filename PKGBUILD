# Maintainer: Wallace Martins da Silva <wallacemartinss@gmail.com>
pkgname=cc-cockpit
pkgver=0.5.0
pkgrel=1
pkgdesc="Claude Code usage panel for Linux: tray indicator, local dashboard and terminal summary"
arch=('any')
url="https://github.com/wallacemartinss/cc-cockpit"
license=('MIT')
depends=('python' 'python-gobject' 'python-cairo' 'libayatana-appindicator')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d93471fc010a004217c62cd0bcdcec165ac6e688a3531fd23b9c9d6533f3dd9d')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=cc-cockpit
Comment=Claude Code usage in the tray
Exec=/usr/bin/cc-cockpit tray
Icon=utilities-system-monitor
Terminal=false
Categories=System;Monitor;
DESKTOP
}
