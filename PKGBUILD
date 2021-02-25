# Maintainer: hiromi-mi <hiromi hyphen mi at cat dot zaq dot jp>
pkgname=python-qulacs
pkgver=0.2.0
pkgrel=1
pkgdesc="Simulate quantum circuits for Python"
arch=('x86_64')
url="https://docs.qulacs.org/"
license=('MIT')
depends=('python')
makedepends=('cmake' 'gcc' 'python-setuptools' 'git')
checkdepends=('python-numpy')
source=("$pkgname-$pkgver.tar.gz::https://github.com/qulacs/qulacs/archive/v${pkgver}.tar.gz")
sha512sums=('d7141ccaaf05b9267ebd24c3fd493a94f6c131677a5fbd34ef674d5305b20a66977f250e2ef0e88ab6ae52967e490d58bfda9abe42c46af217d244b343155ada')

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
    PYTHONPATH="." python python/test/test_qulacs.py
}
