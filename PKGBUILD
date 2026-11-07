# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-python-iso639
pkgver=2026.11.7
pkgrel=1
pkgdesc="Look-up utilities for ISO 639 language codes and names"
license=(Apache-2.0)
arch=(any)
url="https://github.com/jacksonllee/iso639"
depends=(python)
checkdepends=(python-pytest)
makedepends=(python-build python-installer python-setuptools python-wheel)
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('3fd112bcac61e125d0c9ac00235f6dfcc76cf278a83793a64595453ae11f7b29')

build() {
    cd "iso639-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "iso639-$pkgver"
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -P -m pytest -x
}

package() {
    cd "iso639-$pkgver"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
