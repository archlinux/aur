# Maintainer: Ben Davison <benjdavison02@gmail.com>
pkgname=gtkittorrent
pkgver=0.1.2
pkgrel=1
pkgdesc="Modern GTK4 and Libadwaita frontend for qBittorrent"
arch=('any')
url="https://github.com/BenBJD/gtkittorrent"
license=('GPL-3.0-or-later')
depends=(
    'libadwaita'
    'python-gobject'
    'python-qbittorrent-api'
)
optdepends=(
    'qbittorrent-nox: Recommended headless qBittorrent for local instances'
    'qbittorrent: Desktop application fallback for local instances'
)
makedepends=(
    'python-build'
    'python-hatchling'
    'python-installer'
    'python-wheel'
)
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
)
sha256sums=('41fdf567a1ad2b1a4db5b85685137ad6e0db41c61e7911a99524e051063e1d4a')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"

    # Install Python package wheel
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install desktop entry
    install -Dm644 "packaging/io.github.BenBJD.gtkittorrent.desktop" \
        "$pkgdir/usr/share/applications/io.github.BenBJD.gtkittorrent.desktop"

    # Install scalable application icon
    install -Dm644 "packaging/io.github.BenBJD.gtkittorrent.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.BenBJD.gtkittorrent.svg"
}
