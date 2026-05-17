# Maintainer: DevBasi <https://github.com/DevBasi>
pkgname=linux-overlay-sight
_pkgname=Linux-Overlay-Sight-LOS
pkgver=1.0.0
pkgrel=1
pkgdesc="Crosshair overlay for Linux games on KDE Plasma / XWayland"
arch=('any')
url="https://github.com/DevBasi/Linux-Overlay-Sight-LOS"
license=('MIT')
depends=(
    'python'
    'python-pyqt6'
    'qt6-base'
    'hicolor-icon-theme'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-hatchling'
    'python-wheel'
)
optdepends=(
    'libxtst: cursor confinement on multi-monitor X11/XWayland setups'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('95c48b5c54c81898694b03ee0c16b3c36c5c957b94c865b6d4aad0c762aea09b')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 packaging/linux-overlay-sight.desktop \
        "$pkgdir/usr/share/applications/linux-overlay-sight.desktop"

    install -Dm644 assets/linux-overlay-sight.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/linux-overlay-sight.svg"

    for s in 16 24 32 48 64 128 256 512; do
        install -Dm644 "assets/linux-overlay-sight-${s}.png" \
            "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/linux-overlay-sight.png"
    done

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 README_EN.md "$pkgdir/usr/share/doc/$pkgname/README_EN.md"
}
