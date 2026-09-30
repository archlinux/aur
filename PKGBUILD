# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-code-health-analyzer
pkgver=0.1.0
pkgrel=1
pkgdesc="Dependency-free Python static analyzer for code health, complexity and import cycles"
arch=('any')
url="https://github.com/Johnkothapalli/python-code-health-analyzer"
license=('MIT')
depends=('python>=3.11')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
checkdepends=('python-pytest' 'python-pytest-cov')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f17b1106bc47aa03ea93e4dda00acd2f66d5f228a9e9e31917a8ba0c51f36f1c')

build() {
	cd "python-code-health-analyzer-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "python-code-health-analyzer-$pkgver"
	PYTHONPATH="$PWD/src" python -m pytest tests -v
}

package() {
	cd "python-code-health-analyzer-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
