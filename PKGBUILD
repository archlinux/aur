# Maintainer: stabldev <thestabldev@gmail.com>

pkgname=torrra
pkgver=2.2.0
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
    "python-tomli"
    "python-tomli-w"
)
makedepends=(
    "python-build"
    "python-hatchling"
    "python-installer"
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f6838e3af32a5a354da616a4feacdf263c4ca5f476487d567eeb462a975cfa1b')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
