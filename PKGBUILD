# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-api-contract-guardian
pkgver=0.1.0
pkgrel=1
pkgdesc="Monitor OpenAPI schema diffs, detect breaking changes and gate CI on contract violations"
arch=('any')
url="https://github.com/Coding-Dev-Tools/api-contract-guardian"
license=('MIT')
depends=('python' 'python-typer' 'python-rich' 'python-yaml' 'python-jsonschema' 'python-deepdiff')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('edd9eaa56f97181e052ef3932aad29f1ef79aaf45b5afe0df089982f779177ba')

build() {
	cd "api-contract-guardian-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "api-contract-guardian-$pkgver"
	PYTHONPATH="$PWD/src" python -m pytest tests -v
}

package() {
	cd "api-contract-guardian-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
