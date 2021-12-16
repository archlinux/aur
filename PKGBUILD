# Maintainer: hiromi-mi <hiromi hyphen mi at cat dot zaq dot jp>
pkgname=python-qulacs
pkgver=0.3.0
pkgrel=2
pkgdesc="Simulate quantum circuits for Python"
arch=('x86_64')
url="https://docs.qulacs.org/"
license=('MIT')
depends=('python')
makedepends=('cmake' 'gcc' 'python-setuptools' 'git')
checkdepends=('python-numpy')
source=("$pkgname-$pkgver.tar.gz::https://github.com/qulacs/qulacs/archive/v${pkgver}.tar.gz")
sha512sums=('f1f0ed4f3c5cbeb8f9e59546f2adf94e3d219e45cccb2386b67c05d61fd4dde545f19fe6be67c57bd9d402573c4d997fb77426875c711c0f4f3abe793271c06a')

build() {
    cd "qulacs-$pkgver"
    python setup.py build
}

package() {
    cd "qulacs-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

check() {
    cd "qulacs-$pkgver"
    PYTHONPATH="build/lib.linux-x86_64-3.10/" python python/test/test_qulacs.py
}
