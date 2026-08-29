# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-purepdb
pkgver=0.5.0
pkgrel=1
pkgdesc="A minimal, dependency-free pure-Python parser for Microsoft PDB debug-info files"
arch=(any)
url="https://github.com/danielplohmann/purepdb"
license=(BSD-3-Clause)
depends=(python)
makedepends=(python-build python-hatchling python-installer python-wheel)
checkdepends=(python-pytest)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7f7d0324fcea03ecd33af4781dbdc4aa0362fae9f7b3863f634ed6acc0812c08')

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

