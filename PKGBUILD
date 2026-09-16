# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-purepdb
pkgver=0.6.0
pkgrel=1
pkgdesc="A minimal, dependency-free pure-Python parser for Microsoft PDB debug-info files"
arch=(any)
url="https://github.com/danielplohmann/purepdb"
license=(BSD-3-Clause)
depends=(python)
makedepends=(python-build python-hatchling python-installer python-wheel)
checkdepends=(python-pytest)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4dbf29e802e9a0b23341390ac4dcd397e7e140449293c66fc68fef8b98f54c50')

build() {
    cd "purepdb-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "purepdb-$pkgver"
    pytest -x
}

package() {
    cd "purepdb-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
    install -d "$pkgdir/usr/share/licenses/$pkgname/"
    ln -s "$_site/purepdb-$pkgver.dist-info/licenses/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}

