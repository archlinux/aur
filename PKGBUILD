# Maintainer: Jan Keith Darunday <aur@jkcdarunday.mozmail.com>

pkgname=slither
pkgver=0.9.6
pkgrel=1
pkgdesc='A static analysis framework for Solidity'
arch=(x86_64)
url="https://github.com/crytic/slither"
license=('AGPL3')
depends=(python)
makedepends=(python-setuptools)
source=("$url/releases/download/$pkgver/$pkgver.tar.gz")
sha256sums=('f761da28ca6d58a5c28480e1fabc59dd9df33c62f09a2ba7ae96726e416feff2')

build() {
    cd "$srcdir"/$pkgname-$pkgver
    python setup.py build -j$(nproc)
}

package() {
    cd "$srcdir"/$pkgname-$pkgver
    export PYTHONHASHSEED=0
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
