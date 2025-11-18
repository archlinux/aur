# Maintainer: stabldev <thestabldev@gmail.com>

pkgname=torrra
pkgver=1.3.4
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
    "python-uv-build"
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1e563cd5adc4daa5b3056e2e0054b1eabe51d8b401544378c10c54e75b15334b')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
