# Maintainer: Stephan Springer <buzo+arch@Lini.de>

pkgname=python-tibber
_name=pyTibber
pkgver=0.34.4
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
sha256sums=('e806b1d8e933d2631adf4b6a8b2dcea969d11d4634388f3b7392337b0c24ff4c')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
