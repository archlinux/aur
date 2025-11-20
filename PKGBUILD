# Maintainer: Rui Jiang <me@ruijiang.me>
pkgname=python-endesive
pkgver=2.19.2
pkgrel=1
pkgdesc="Python library for creating and validating PDF crypto signatures"
arch=('any')
url="https://github.com/m32/endesive"
license=('MIT')
depends=(
    'python'
    'python-cryptography'
    'python-asn1crypto'
    'python-pytz'
    'python-pillow'
    'python-pyopenssl'
)
optdepends=(
    'python-lxml: optional XML parsing'
    'python-pykcs11: optional PKCS11 support'
    'python-requests: optional HTTP support'
    'python-paramiko: optional SSH support'
)
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5237dc68a9be3ea71689d2d92f9585a024c154a1b8f98ca178fe387cb0aa9d20')

build() {
    cd "$srcdir/endesive-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/endesive-$pkgver"
    python -m pip install --root="$pkgdir" --no-deps --ignore-installed dist/*.whl
}
