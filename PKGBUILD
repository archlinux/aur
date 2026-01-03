# Maintainer: stabldev <thestabldev@gmail.com>

pkgname=torrra
pkgver=2.0.6
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
    "python-hatchling"
    "python-installer"
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1a22dc01e821fcee3c102ba44aa13ffb0e53bb570a804ebdbb0d87a7fca9118c')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
