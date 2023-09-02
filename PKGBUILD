# Maintainer: Maks Verver <maksverver@geocities.com>

pkgname=python-pgzip
pkgver=0.3.5
pkgrel=1
pkgdesc='Multi-threaded gzip implementation for Python'
arch=('any')
url='https://github.com/pgzip/pgzip'
license=('MIT')
source=("pgzip-$pkgver.tar.gz::https://github.com/pgzip/pgzip/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('a47d269fe68d35f3db01e5eb3ece4727eee3404806d9413550c53fcceff06c2e00911569550d272bb0773865bbc3d10c87e7a7b9439e34d4be7a2468154ba787')
makedepends=(
    'python-build'
    'python-installer'
    'python-pytest'
    'python-setuptools'
    'python-wheel'
)

build() {
    cd pgzip-$pkgver
    python -m build --wheel --no-isolation
}

check() {
    cd pgzip-$pkgver
    PYTHONPATH=. pytest
}

package() {
    cd pgzip-$pkgver
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
