# Maintainer: NEOLPAR
pkgname=cursor-companion
pkgver=0.1.1
pkgrel=1
pkgdesc='Animated pet companion for the KDE Plasma cursor'
arch=('any')
url='https://github.com/NEOLPAR/cursor-companion'
license=('MIT')
depends=('python' 'python-pyqt6' 'python-pyqt6-webengine' 'qt6-tools' 'xdg-utils')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('46de54a2fa5976d458ac2d7b6f2b6f8fb762abe561d92a46ab0a06cc9ac0c6bb')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 packaging/linux/io.github.NEOLPAR.CursorCompanion.desktop \
    "$pkgdir/usr/share/applications/io.github.NEOLPAR.CursorCompanion.desktop"
  install -Dm644 src/cursor_companion/assets/cursor-companion.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/cursor-companion.svg"
}
