# Maintainer: gergi
pkgname=python-pyzipper
pkgver=0.3.6
pkgrel=1
pkgdesc="A Python library for creating and extracting ZIP files with AES encryption"
arch=('any')
url="https://github.com/danifus/pyzipper"
license=('MIT')
depends=('python>=3.6' 'python-cryptography')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/danifus/pyzipper/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c4b0a4182a9e925a1b7d65fbbc161a2e4b469082b222f38b49a85b094433c668')

build() {
    cd "$srcdir/pyzipper-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/pyzipper-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
