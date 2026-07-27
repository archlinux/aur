# Maintainer: Thentik <authentik50@gmail.com>
pkgname=devilbox-tray
pkgver=1.0.1
pkgrel=1
pkgdesc="Tray app to control Devilbox (start/stop containers) from any SNI system tray"
arch=('any')
url="https://github.com/thentik/devilbox-tray"
license=('MIT')
depends=('python' 'pyside6' 'docker')
optdepends=('docker-compose: Compose v2 plugin (recommended)')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3151f9caef7ed1338c708f543aaaac4be0f1f5132b1fa4180468b197374f7ac8')

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
