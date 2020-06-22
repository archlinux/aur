# Maintainer: hiromi-mi <hiromi hyphen mi at cat dot zaq dot jp>
pkgname=python-qulacs
pkgver=0.1.10.1
pkgrel=1
pkgdesc="Simulate quantum circuits for Python"
arch=('x86_64')
url="https://docs.qulacs.org/"
license=('MIT')
depends=('python')
makedepends=('cmake' 'gcc' 'python-setuptools' 'git')
checkdepends=('python-numpy')
source=("$pkgname-$pkgver.tar.gz::https://github.com/qulacs/qulacs/archive/v${pkgver}.tar.gz")
sha512sums=('2eef707bcd6a6fca763ef5f11a662661123ae622cc4aa1e5b78a849260b1fa3d36c7f0b8379641763504ede6aadc397f1df501d83b150a4d43d56bb4aa21ca14')

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
    python python/test/test_qulacs.py
}
