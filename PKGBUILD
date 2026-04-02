# Maintainer: Morgan <morgan@mordup.com>
pkgname=ctfl
pkgver=2.4.1
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
sha256sums=('8b1f40475d41eccbcb58e777158b7f3377dfa88c69f56c131e43bd2396f6540a')

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
