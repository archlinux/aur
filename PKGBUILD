# Maintainer: Benoît Allard <benoit.allard@gmx.de>
pkgname=python-grpclib
pkgver=0.4.7
pkgrel=1
pkgdesc="Pure-Python gRPC implementation for asyncio"
arch=('any')
url="http://grpclib.readthedocs.io/"
license=('BSD')
makedepends=("python-pytest" "python-pytest-asyncio" "python-async-timeout" "python-faker")
depends=("python" "python-h2" "python-multidict" "python-certifi"
         "python-importlib-metadata" "python-setuptools" "python-googleapis-common-protos" "python-certifi")
optdepends=(
    "python-protobuf: for protobuf support"
)
_name=${pkgname#python-}
source=("$pkgname-$pkgver.tar.gz::https://github.com/vmagamedov/$_name/archive/v$pkgver.tar.gz")
sha256sums=('ae9de92b72c2dfed6a22aeb57a3f3b6701331d5e451c727253e4453c95862553')


build() {
    cd $_name-$pkgver
    export PYTHONSEED=1
    python setup.py build
}

check() {
    cd $_name-$pkgver
    python -m pytest -v
}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
