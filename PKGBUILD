# Maintainer: Kyrillos Kamal <kyrillos@example.com>
pkgname=netmon-gui
pkgver=0.2.0
pkgrel=1
pkgdesc="Modern network monitor for Arch Linux with PySide6 GUI - speed test, bandwidth, connections, quota tracking"
arch=('any')
url="https://github.com/KyrilosKamal/NetMon"
license=('MIT')
depends=(
    'python>=3.11'
    'pyside6'
    'python-psutil'
    'speedtest-cli'
    'python-pyqtgraph'
    'python-colorama'
    'python-pyside6-fluent-widgets'
    'qt6-wayland'
    'hicolor-icon-theme'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
    "netmon-gui.desktop"
    "netmon-gui.sh"
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

build() {
    cd "$srcdir/NetMon-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/NetMon-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    install -Dm644 "$srcdir/netmon-gui.desktop" \
        "$pkgdir/usr/share/applications/netmon-gui.desktop"
    
    install -Dm755 "$srcdir/netmon-gui.sh" \
        "$pkgdir/usr/bin/netmon-gui"
    
    if [ -f LICENSE ]; then
        install -Dm644 LICENSE \
            "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
