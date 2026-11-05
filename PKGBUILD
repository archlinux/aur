# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Aseem Athale <athaleaseem@gmail.com>

pkgname=python-pinecone
pkgver=10.3.0
pkgrel=1
pkgdesc="Python Pinecone client and SDK"
arch=(x86_64 aarch64)
url="https://github.com/pinecone-io/pinecone-python-client"
license=(Apache-2.0)
depends=(python python-anyio python-httpx python-msgspec python-orjson)
makedepends=(python-build python-installer python-wheel python-maturin protobuf-c)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('f5aaf63003b7a79e8753b201ab15e002037e7e14a729d461ae30a253f586606130ed934bea5e63f95b4e33097b2e5592d375090f32a3f3544fcefd4c9e63cc40')

prepare() {
    cd "python-sdk-$pkgver"
    cargo fetch --locked --target host-tuple
}

build() {
    cd "python-sdk-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "python-sdk-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
