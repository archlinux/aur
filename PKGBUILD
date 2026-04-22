# Maintainer: Your Name <your@email.com>
pkgname=meter-tray
pkgver=0.1.0
pkgrel=2
pkgdesc="System tray app for tracking AI usage limits (Codex, OpenCode)"
arch=('any')
url="https://github.com/xddinside/meter"
license=('MIT')
depends=('python' 'python-pystray' 'python-pillow')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'git')
source=("git+https://github.com/xddinside/meter.git#commit=70d27702e452184a5c18bf0cfeadd5c17b52012e")
sha256sums=('SKIP')

build() {
    cd "meter"
    python -m build --wheel --no-isolation
}

package() {
    cd "meter"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install .desktop file
    install -Dm644 autostart/meter.desktop "$pkgdir/usr/share/applications/meter.desktop"
}
