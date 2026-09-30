# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-envault
pkgver=0.1.0
pkgrel=1
pkgdesc="Env variable syncing, diffing and secret rotation CLI with secret-store integrations"
arch=('any')
url="https://github.com/Coding-Dev-Tools/envault"
license=('MIT')
depends=('python' 'python-typer' 'python-rich' 'python-dotenv' 'python-yaml' 'python-cryptography' 'python-pydantic')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-responses' 'python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('db97b76ae9a63e3fdeb0745f94cf5297aadb6c18be2feb24b1bc2aa4d3af48c9')

build() {
	cd "envault-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "envault-$pkgver"
	PYTHONPATH="$PWD/src" python -m pytest tests -v --ignore=tests/test_lint_regression.py
}

package() {
	cd "envault-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
