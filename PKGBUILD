# Maintainer: stabldev <thestabldev@gmail.com>

pkgname=torrra
pkgver=1.2.8
pkgrel=1
pkgdesc="A Python tool that lets you find and download torrents without leaving your CLI."
arch=("any")
url="https://github.com/stabldev/torrra"
license=("MIT")
depends=(
    "libtorrent-rasterbar"
    "python"
    "python-click"
    "python-diskcache"
    "python-httpx"
    "python-platformdirs"
    "python-textual"
    "python-tomli-w"
)
makedepends=(
    "python-build"
    "python-installer"
    "python-wheel"
    "python-hatchling"
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8b25ae68a498bd3e765b9ff865dfe5ca48e1e4749e5475ab9235e9737a1a964a')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
