# Maintainer: gergi
pkgname=python-xknx
pkgver=4.1.0
pkgrel=1
pkgdesc="An Asynchronous Library for the KNX protocol"
arch=('any')
url="https://github.com/XKNX/xknx"
license=('MIT')
depends=('python>=3.11' 'python-cryptography>=35.0.0' 'python-ifaddr>=0.1.7')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('python-typing_extensions: required for Python < 3.13')
source=("$pkgname-$pkgver.tar.gz::https://github.com/XKNX/xknx/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('83db49f8747c9255724986be8c42c8faa4938f26231bed14384ee95ef963f227')

build() {
    cd "$srcdir/xknx-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/xknx-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
