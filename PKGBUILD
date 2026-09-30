# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-jlkit
pkgver=0.1.1
pkgrel=1
pkgdesc="JSONL-native command-line toolkit: head, tail, select, filter, stats, schema, validate"
arch=('any')
url="https://github.com/arden-instance/jlkit"
license=('MIT')
depends=('python>=3.12')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b0b2cff1618fe028c7ef1732d30d615a24eea8f6cfd20d1e6b8c962ecc1977d7')

build() {
	cd "jlkit-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "jlkit-$pkgver"
	python -m pytest tests -v
}

package() {
	cd "jlkit-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
