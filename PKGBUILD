# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-demangle
_pkgname=demangle
pkgver=0.9.4
pkgrel=1
pkgdesc="Read mangled symbol names in pure Python"
arch=(any)
url="https://github.com/r0ny123/demangle"
license=(MIT)
depends=(python)
makedepends=(
    python-build
    python-installer
    python-hatchling
    python-setuptools
    python-wheel
)
checkdepends=(python-pytest)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('72e5975df26ca26a34137cc326dc35d636a226cf9cee3606605e5454aeb5827d')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$pkgver"
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -P -m pytest -x -o addopts=""
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
