# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-purepdb
pkgver=0.4.0
pkgrel=1
pkgdesc="A minimal, dependency-free pure-Python parser for Microsoft PDB debug-info files"
arch=(any)
url="https://github.com/danielplohmann/purepdb"
license=(BSD-3-Clause)
depends=(python)
makedepends=(python-build python-hatchling python-installer python-wheel)
checkdepends=(python-pytest)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ae17cb4d8905accaa4d6795fc66047cb3610d006975e21f913f723da8436802b')

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

