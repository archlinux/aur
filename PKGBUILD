# Maintainer: Stephan Springer <buzo+arch@Lini.de>

pkgname=python-tibber
_name=pyTibber
pkgver=0.38.0
pkgrel=1
pkgdesc='Python3 library for Tibber'
arch=(any)
url="https://github.com/Danielhiversen/$_name"
license=(GPL-3.0-only)
depends=(
    python-aiohttp
    python-gql
    python-websockets
)
makedepends=(
    python-build
    python-installer
    python-setuptools
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2e7495ea6f4d096fbe140afed5880983f94d8b8edc5a9e5b600c64446e136ae5')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
