# Maintainer: Thentik <authentik50@gmail.com>
pkgname=devilbox-tray
pkgver=1.0.0
pkgrel=1
pkgdesc="Tray app to control Devilbox (start/stop containers) from any SNI system tray"
arch=('any')
url="https://github.com/thentik/devilbox-tray"
license=('MIT')
depends=('python' 'pyside6' 'docker')
optdepends=('docker-compose: Compose v2 plugin (recommended)')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('628b540bdd563b57e13e8384089906ad944a516842d13ef101b173da8292332e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 data/devilbox-tray.desktop \
    "$pkgdir/usr/share/applications/devilbox-tray.desktop"
  install -Dm644 data/devilbox-tray.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/devilbox-tray.svg"
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
