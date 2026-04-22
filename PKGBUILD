# Maintainer: Your Name <your@email.com>
pkgname=meter-tray
pkgver=0.1.0
pkgrel=1
pkgdesc="System tray app for tracking AI usage limits (Codex, OpenCode)"
arch=('any')
url="https://github.com/xddinside/meter"
license=('MIT')
depends=('python' 'python-pystray' 'python-pillow')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "meter-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "meter-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install .desktop file
    install -Dm644 autostart/meter.desktop "$pkgdir/usr/share/applications/meter.desktop"

    # Install license (if you add one)
    # install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
