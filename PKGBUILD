# Maintainer: Benoît Allard <benoit.allard@gmx.de>
pkgname=python-grpclib
pkgver=0.4.3
pkgrel=1
pkgdesc="Pure-Python gRPC implementation for asyncio"
arch=('any')
url="http://grpclib.readthedocs.io/"
license=('BSD')
makedepends=("python" "python-pytest" "python-pytest-asyncio" "python-async-timeout" "python-faker")
depends=("python" "python-h2" "python-multidict")
optdepends=(
    "python-protobuf: for protobuf support"
)
_name=${pkgname#python-}
source=("$pkgname-$pkgver.tar.gz::https://github.com/vmagamedov/$_name/archive/v$pkgver.tar.gz")
sha256sums=('b8f191a0596698f40777af007056ababb92c74561cf67fbc62bd8d5b5a19b12a')

build() {
    cd $_name-$pkgver
    export PYTHONSEED=1
    python setup.py build
}

check() {
    cd $_name-$pkgver
    export PYTHONPATH=.
    pytest -k 'not test_default_ssl_context'
}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
