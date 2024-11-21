# Maintainer: Ben Copeland <ben@copeland.me.uk>
pkgname=tuxsuite
pkgver=1.42.2
pkgrel=1
pkgdesc="A command-line client for TuxSuite services"
arch=('any')
url="https://docs.tuxsuite.com/"
license=('Apache')
depends=('python' 'python-pip' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-dkim' 'b4' 'python-voluptuous' 'python-flask' 'python-flask-restful')
makedepends=('python-setuptools' 'python-build')
source=("https://files.pythonhosted.org/packages/source/t/tuxsuite/tuxsuite-$pkgver.tar.gz")
sha256sums=('50e27f3f77353deeddf1e4eec5b7d32015af37158315c34232303af3b248e839')


build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    export PYTHONPATH="$srcdir/$pkgname-$pkgver:$PYTHONPATH"
    pytest
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

