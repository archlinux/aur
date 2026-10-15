# Maintainer: Stephan Springer <buzo+arch@Lini.de>

pkgname=python-tibber
_name=pyTibber
pkgver=0.39.0
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
sha256sums=('0ddd2fb2df5b9ba6f787e1feaa85082237e82011f69c6391684b93da8f291933')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
