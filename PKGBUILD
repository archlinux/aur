# Maintainer: Kyrillos Kamal <kyrillos@example.com>
pkgname=netmon-gui
pkgver=0.2.0
pkgrel=2
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
    "netmon-gui-16.png"
    "netmon-gui-24.png"
    "netmon-gui-32.png"
    "netmon-gui-48.png"
    "netmon-gui-64.png"
    "netmon-gui-128.png"
    "netmon-gui-256.png"
)
sha256sums=('922a818cbdd81ab05e20aa90ab62dad7089a301a1db327a146f31a86a4288a10'
            'bb8dbd776b5502e7648067b637797f579a12557ad55b81b4ca235e94a6a4ea2d'
            'fe80d4007ef98553bde7a68b3405ff81aa7279aea083f4d8bfd070824b5a2015'
            'fdfab3a0a58b622d42c232c0a32ed7d7c3acbfb43de78ff1893a6b2340a41da8'
            'f3c6cf08023e22405a6d15daca4b8d4cdbe0d5da947173aebeeb2bf646133c95'
            '5829242709676430a1763e3f6b602ce936e684f1ace752ba6178f3cdd7eeb4f9'
            '2e6dd845d84023255a41e0fb71b5432a723a492623f3dd932c943127ab2bc44d'
            '30043bcf0bf97531a58d67a14d25ec8764e7219cf3f1d1588f95a5cfc0cbd002'
            '44d3bc9a1076d55c58f34487280f188c02979f9fce0104e76dba3c9c9bc80913'
            '833c85c52f96eaee5339d824395acb502b8a02377f109e4bb8ecf1d0da16ce54')

build() {
    cd "$srcdir/NetMon-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/NetMon-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    # Install desktop entry
    install -Dm644 "$srcdir/netmon-gui.desktop" \
        "$pkgdir/usr/share/applications/netmon-gui.desktop"
    
    # Install launcher script
    install -Dm755 "$srcdir/netmon-gui.sh" \
        "$pkgdir/usr/bin/netmon-gui"
    
    # Install application icons in standard hicolor sizes
    install -Dm644 "$srcdir/netmon-gui-16.png" \
        "$pkgdir/usr/share/icons/hicolor/16x16/apps/netmon-gui.png"
    install -Dm644 "$srcdir/netmon-gui-24.png" \
        "$pkgdir/usr/share/icons/hicolor/24x24/apps/netmon-gui.png"
    install -Dm644 "$srcdir/netmon-gui-32.png" \
        "$pkgdir/usr/share/icons/hicolor/32x32/apps/netmon-gui.png"
    install -Dm644 "$srcdir/netmon-gui-48.png" \
        "$pkgdir/usr/share/icons/hicolor/48x48/apps/netmon-gui.png"
    install -Dm644 "$srcdir/netmon-gui-64.png" \
        "$pkgdir/usr/share/icons/hicolor/64x64/apps/netmon-gui.png"
    install -Dm644 "$srcdir/netmon-gui-128.png" \
        "$pkgdir/usr/share/icons/hicolor/128x128/apps/netmon-gui.png"
    install -Dm644 "$srcdir/netmon-gui-256.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/netmon-gui.png"
    
    # Install license
    if [ -f LICENSE ]; then
        install -Dm644 LICENSE \
            "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
