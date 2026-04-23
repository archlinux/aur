# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname='python-python-iso639'
pkgver='2026.4.20'
pkgrel=1
pkgdesc="Look-up utilities for ISO 639 language codes and names"
license=('Apache-2.0')
arch=('any')
url="https://github.com/jacksonllee/iso639"
depends=('python')
checkdepends=('python-pytest')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('90095aebc44a35375ef7c2762b40013fab869e7377e53e1608398dc3ab613269')

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
