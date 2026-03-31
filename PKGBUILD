# Maintainer: Dunky <braxtinmoss13@gmail.com>

pkgname=niri-companion
pkgver=4.0.0
pkgrel=1
pkgdesc="Niri companion scripts: config generation, IPC extensions, workspace management"
arch=('any')
url='https://github.com/dybdeskarphet/niri-companion'
license=('GPL-3.0-or-later')
depends=(
    'python'
    'python-pydantic'
    'python-rich'
    'python-tomli-w'
    'python-typer'
    'python-watchdog'
    'niri'
)
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dybdeskarphet/niri-companion/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('834de3ca1595d63c6a1b1c9da8df37abe63ae6bcd965e37829ed046a56d01626')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
