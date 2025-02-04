# Maintainer: Harriet O'Brien <harrietobrien@protonmail.com>
# Contributor: Marco Rubin <marco.rubin@protonmail.com>

_name=rpcq
pkgname=python-$_name
pkgver=3.10.0
pkgrel=1
pkgdesc='The RPC framework and message specification for @rigetti Quantum Cloud Services.'
arch=(any)
url='https://github.com/rigetti/rpcq'
license=('Apache')
depends=(python python-msgpack python-pyzmq python-rapidjson python-ruamel-yaml)
makedepends=(python-build python-installer python-poetry python-wheel)
checkdepends=(python-pytest python-pytest-asyncio)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('eed9accd410805b8aa0f649e7bfb68a9c6791c7efc67bc8420f7f83287340242a4ee6cb16f6a7c72b2c8681c7fb6c198de9ce56b73ca3edaafd5dff3c41f155c')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

check() {
    cd $_name-$pkgver
    pytest
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
