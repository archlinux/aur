# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-demangle
_pkgname=demangle
pkgver=0.6.0
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
sha256sums=('539e80f7f79923381ecc6a3d78e9905763b0987b1b9566e77441cf07b3911100')

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
