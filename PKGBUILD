# Maintainer: gergi
pkgname=python-xknx
pkgver=4.0.0
pkgrel=1
pkgdesc="An Asynchronous Library for the KNX protocol"
arch=('any')
url="https://github.com/XKNX/xknx"
license=('MIT')
depends=('python>=3.11' 'python-cryptography>=35.0.0' 'python-ifaddr>=0.1.7')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('python-typing_extensions: required for Python < 3.13')
source=("$pkgname-$pkgver.tar.gz::https://github.com/XKNX/xknx/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d968548f9dd0a820535905e3ccbb7b37ada76fefc3109920f8fde05bba2b1f6a')

build() {
    cd "$srcdir/xknx-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/xknx-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
