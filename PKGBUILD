# Maintainer: Stephan Springer <buzo+arch@Lini.de>

pkgname=python-tibber
_name=pyTibber
pkgver=0.34.0
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
sha256sums=('bc31af571499d3f6b864c14be805780edf1942f228eecd06013649423eb24b5c')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
