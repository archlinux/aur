# Maintainer: Morgan <morgan@mordup.com>
pkgname=ctfl
pkgver=2.9.2
pkgrel=1
pkgdesc="Claude Tracker For Linux — system tray monitor for Claude usage"
arch=('any')
url="https://github.com/mordup/ctfl"
license=('MIT')
depends=(
    'python'
    'python-pyqt6'
    'python-keyring'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/mordup/ctfl/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fb41a36f6c04f09e8e88a2e0114f0453da699ca4007dc2ad10632d4c3a2d9e51')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 icons/ctfl.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/ctfl.svg"
    install -Dm644 ctfl.desktop \
        "$pkgdir/usr/share/applications/ctfl.desktop"
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
