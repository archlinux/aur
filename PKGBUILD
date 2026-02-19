# Maintainer: Rui Jiang <me@ruijiang.me>
pkgname=python-endesive
pkgver=2.19.3
pkgrel=1
pkgdesc="Python library for creating and validating PDF crypto signatures"
arch=('any')
url="https://github.com/m32/endesive"
license=('MIT')
depends=(
    'python'
    'python-cryptography'
    'python-asn1crypto'
    'python-pillow'
    'python-pip'
    'python-pytz'
    'python-pyopenssl'
    'python-setuptools'
)
optdepends=(
    'python-lxml: optional XML parsing'
    'python-pykcs11: optional PKCS11 support'
    'python-requests: optional HTTP support'
    'python-paramiko: optional SSH support'
)
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b4c287f0dbae34e81bb0f828551818aaab3dd6ba857feb3c484c8c9e1170adae')

build() {
    cd "$srcdir/endesive-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/endesive-$pkgver"
    python -m pip install --root="$pkgdir" --no-deps --ignore-installed dist/*.whl
}
