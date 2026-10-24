# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Aseem Athale <athaleaseem@gmail.com>

pkgname=python-pinecone
pkgver=10.2.0
pkgrel=1
pkgdesc="Python Pinecone client and SDK"
arch=(x86_64 aarch64)
url="https://github.com/pinecone-io/pinecone-python-client"
license=(Apache-2.0)
depends=(python python-anyio python-httpx python-msgspec python-orjson)
makedepends=(python-build python-installer python-wheel python-maturin protobuf-c)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('53ab3f6ac75cd6b47f2d6fe9475a8b7124f2251f08589a28874de5013087671855c3bbffa4eeb02bc4c701b7891a502558632e8369c078875e1d428dc61081d9')

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
