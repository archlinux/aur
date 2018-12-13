# Maintainer: Ainola

pkgname=python-vipaccess
pkgver=0.10.0
pkgrel=2
pkgdesc="A free software implementation of Symantec's VIP Access application and protocol."
arch=('any')
url="https://github.com/dlenski/python-vipaccess"
license=('Apache')
makedepends=('python-nose')
depends=('python-setuptools' 'python-pycryptodome' 'python-lxml' 'python-oath' 'python-requests')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dlenski/python-vipaccess/archive/v$pkgver.tar.gz")
sha256sums=('ceee345ea955603ed31f6c34e44aff08e7447ece08c60ee40d520bac4fc0d705')

prepare() {
    sed -i 's/pycryptodome==3.6.6/pycryptodome>=3.6.6/' "python-vipaccess-$pkgver/setup.py"
}

build() {
    cd "python-vipaccess-$pkgver"
    python setup.py build
}

check() {
    cd "python-vipaccess-$pkgver"
    python setup.py test
}

package_python-vipaccess() {
    cd "python-vipaccess-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
