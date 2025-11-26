# Maintainer: Smoolak <smoolak [at] gmail.com>.

pkgname=python-dllist
pkgver=2.0.0
pkgrel=1
pkgdesc="List the shared libraries loaded by the current process"
arch=('any')
url="https://github.com/wardbrian/dllist"
license=('BSD-3-Clause')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wardbrian/dllist/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9e22902e0ca31f6cc76ea259eace25f2e52f6a4b35b956e95cff166c772503b3')

build() {
    cd "dllist-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "dllist-$pkgver"
    python -m pytest -v test/
}

package() {
    cd "dllist-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
