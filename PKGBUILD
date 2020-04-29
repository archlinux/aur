# Maintainer: hiromi-mi <hiromi hyphen mi at cat dot zaq dot jp>
pkgname=python-qulacs
pkgver=0.1.9
pkgrel=1
pkgdesc="Simulate quantum circuits for Python"
arch=('x86_64')
url="https://docs.qulacs.org/"
license=('MIT')
depends=('python')
makedepends=('cmake' 'gcc' 'python-setuptools' 'git')
checkdepends=('python-numpy')
source=("$pkgname-$pkgver.tar.gz::https://github.com/qulacs/qulacs/archive/v${pkgver}.tar.gz")
sha512sums=('18b41bd89bb6e31cd9e933305d64f37d26e709ec8094e47c029001e54e9a5002b51dcf30b4cdae195c406c731f0934f2c1cee0e04d1d99d7e8eeca08aa29739b')

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
