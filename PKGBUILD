# Maintainer: hiromi-mi <hiromi hyphen mi at cat dot zaq dot jp>
pkgname=python-qulacs
pkgver=0.1.10
pkgrel=1
pkgdesc="Simulate quantum circuits for Python"
arch=('x86_64')
url="https://docs.qulacs.org/"
license=('MIT')
depends=('python')
makedepends=('cmake' 'gcc' 'python-setuptools' 'git')
checkdepends=('python-numpy')
source=("$pkgname-$pkgver.tar.gz::https://github.com/qulacs/qulacs/archive/v${pkgver}.tar.gz")
sha512sums=('1801a958fbf6995cfb4b3c204a89916fa231d15cb66adae9625a959a27803cac8b48cbad872d0d6f48b2929b586da0be4e3329c899707b9084d2c842f23d93d5')

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
