# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-python-iso639
pkgver=2026.7.23
pkgrel=1
pkgdesc="Look-up utilities for ISO 639 language codes and names"
license=(Apache-2.0)
arch=(any)
url="https://github.com/jacksonllee/iso639"
depends=(python)
checkdepends=(python-pytest)
makedepends=(python-build python-installer python-setuptools python-wheel)
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ffb90f6c0fb0a08b428b6f6189e3516a33c238ca9a293e3a45341d269cebf6c0')

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
