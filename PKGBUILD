# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Aseem Athale <athaleaseem@gmail.com>

pkgname=python-pinecone
pkgver=10.0.0
pkgrel=1
pkgdesc="Python Pinecone client and SDK"
arch=(x86_64 aarch64)
url="https://github.com/pinecone-io/pinecone-python-client"
license=(Apache-2.0)
depends=(python python-anyio python-httpx python-msgspec python-orjson)
makedepends=(python-build python-installer python-wheel python-maturin protobuf-c)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('a4646dd986b08ebada762e8d0cb6f86f9290f6f64e939c538d64c1a7c9642fc8b5f41ca4e61377b251ca173bfd669d0b8249c04f7ab43347ed44158961765c66')

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
