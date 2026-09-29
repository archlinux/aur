# Maintainer: Morgan <morgan@mordup.com>
pkgname=ctfl
pkgver=2.13.0
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
sha256sums=('98fc233efd1c33409a89c1762bbcac4a7093d59e0f10a14377cc30a2d90ce3c1')

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
