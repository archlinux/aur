# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Aseem Athale <athaleaseem@gmail.com>

pkgname=python-pinecone
pkgver=10.1.0
pkgrel=1
pkgdesc="Python Pinecone client and SDK"
arch=(x86_64 aarch64)
url="https://github.com/pinecone-io/pinecone-python-client"
license=(Apache-2.0)
depends=(python python-anyio python-httpx python-msgspec python-orjson)
makedepends=(python-build python-installer python-wheel python-maturin protobuf-c)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('2af48e2df7a012bac9e390052cecf80ab416f297073a6101193a9b24f151be9b099d19657aaec0144c5525fffefbe05b1fd929cfa3d73951bd1402b12cc92000')

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
