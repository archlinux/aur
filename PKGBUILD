# Maintainer: Benoît Allard <benoit.allard@gmx.de>
pkgname=python-grpclib
pkgver=0.4.9
pkgrel=1
pkgdesc="Pure-Python gRPC implementation for asyncio"
arch=('any')
url="http://grpclib.readthedocs.io/"
license=('BSD')
makedepends=("python-build" "python-installer" "python-pytest" "python-pytest-asyncio" "python-async-timeout" "python-faker")
depends=("python" "python-h2" "python-multidict" "python-certifi"
         "python-importlib-metadata" "python-setuptools" "python-googleapis-common-protos" "python-certifi")
optdepends=(
    "python-protobuf: for protobuf support"
)
_name=${pkgname#python-}
source=("$pkgname-$pkgver.tar.gz::https://github.com/vmagamedov/$_name/archive/v$pkgver.tar.gz")
sha256sums=('c2397d3af8a2016bc2c743f376c6058b717ed75ba700c98a4def405143a12987')


build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

check() {
    cd $_name-$pkgver
    python -m pytest -v
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir "$pkgdir" dist/*.whl
}
