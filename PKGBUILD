# Maintainer: Morgan <morgan@mordup.com>
pkgname=ctfl
pkgver=2.9.0
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
sha256sums=('81dfb2926392548e1ef7d365c7173de59288ce1aac7a81a96ef44891e9a1be6b')

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
